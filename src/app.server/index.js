'use strict';

const _ = require('lodash');
const async = require('async');
const crypto = require('crypto');
const express = require('express');
const glob = require('glob');
const path = require('path');
const fs = require('fs');
const bodyParser = require('body-parser');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const session = require('express-session');
const KnexSessionStore = require('connect-session-knex')(session);
const helmet = require('helmet');
const multer  = require('multer');

const auth = require('./auth');
const sendFileOr403 = require('./send-file');
const serverConfig = require('./server-config');

const rootPath = path.resolve(`${__dirname}/../..`);
const app = require('./app');

function joinVerifyPath(rootPath, parent, filePath) {
  const absParent = path.join(rootPath, parent);
  const res = path.resolve(path.join(absParent, filePath));
  if (!res.startsWith(`${absParent}/`)) {
    return '';
  }

  return res;
}

const existsCache = {};
function serveStatic(req, res, next) {
  var filePath = req.url.replace(/\?.*$/, '');
  var buildPath = joinVerifyPath(rootPath, 'build', filePath)
    , srcPath = joinVerifyPath(rootPath, 'src', filePath);
  if (existsCache[buildPath]) {
    return sendFileOr403(res, buildPath);
  } else if (existsCache[srcPath]) {
    return sendFileOr403(res, srcPath);
  }

  fs.exists(buildPath, function(exists) {
    if (exists) {
      existsCache[buildPath] = true;
      sendFileOr403(res, buildPath);
    } else {
      fs.exists(srcPath, function(exists) {
        if (exists) {
          existsCache[srcPath] = true;
          sendFileOr403(res, srcPath);
        } else {
          next();
        }
      });
    }
  });
}


const base = (function() {
  const handlebars = require('handlebars');
  const template = handlebars.compile(
    fs.readFileSync(`${__dirname}/../views/index.hbs`, 'utf8'),
    { min: true }
  );

  return function(content) {
    return template({
                      appEntry: serverConfig.appEntry,
                      fontAwesomeVersion: serverConfig.fontAwesomeVersion,
                      content: content,
                      // nav: initData.navTemplate(clientConfig),
                      // phnetConfig: config
                    });
  };
})();


const prefetch = [
  `</${serverConfig.appEntry}>; rel=prefetch`,
  '</assets/index.css>; rel=prefetch',
  `</assets/font-awesome.woff2?v=${serverConfig.fontAwesomeVersion}>; rel=prefetch`
];


(function init() {
  app.use(helmet({
    contentSecurityPolicy: require('./content-security-policy')
  }));

  app.enable('strict routing');
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: true }));

  app.use(session({
    secret: serverConfig.sessionSecret || crypto.randomBytes(64).toString('hex'),
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: true
    },
    store: new KnexSessionStore({
      knex: require('./bookshelf').knex,
      tablename: 'sessions'
    })
  }));

  passport.use(new LocalStrategy({
      usernameField: 'email',
      passwordField: 'passwd',
      session: true
    },
    function(email, password, done) {
      require('./auth').login(email, password, (err, user) => {
        return done(err, err ? null : user);
      });
    }
  ));
  passport.serializeUser(function(user, done) {
    done(null, user.id);
  });
  passport.deserializeUser(function(id, done) {
    require('./auth').getUserById(id, function(err, user) {
      done(err, user);
    });
  });

  app.get('/reviews', function(req, res) {
    require('./review-feed').xml((err, xml) => {
      if (err) {
        res.status(500);
        return res.json(err.message);
      }

      res.status(200);
      res.set('Content-type', 'text/xml; charset=UTF-8');
      res.send(xml);
    });
  });
  app.get('/books/rss', (req, res) => {
    res.redirect('/reviews');
  });
  app.get('/books/feed', (req, res) => {
    res.redirect('/reviews');
  });

  app.post('/api/login', function(req, res) {
    console.log(`Trying to login as ${req.body.email}`);
    passport.authenticate('local', function(err, user, info) {
      if (err) {
        console.log(`Error logging in: ${err.message}`, err);
        res.render('login', {
          error: err.message === 'ERR:RATE' ?
            'Please wait a moment before trying to login again' :
            'Invalid username or password'
        });
        return;
      }

      if (!user) {
        console.log('No user found');
        return res.redirect('/login');
      }

      req.logIn(user, function(err) {
        if (err) {
          console.error(`Login failed: ${err.message}`, err);
          return next(err);
        }

        console.error(`Logged in user: ${req.body.email}`);
        return res.redirect('/');
      });
    })(req, res, next);
  });

  app.post('/api/generate-token', (req, res, next) => {
    console.log('generate-token');

    if (!req.body.email) {
      console.log('No email address found');
      res.status(400);
      return next();
    }

    console.log(`Try to generate token for ${req.body.email}`);
    require('./auth').createResetToken(req.body.email, (err) => {
      if (err) {
        res.status(400).json({ error: err.message });
        return next();
      }

      res.status(200).json({});
      return next();
    });
  });

  app.get('/reset-password/:token', (req, res, next) => {
    auth.getUserByToken(req.params.token, (err, user) => {
      if (err || !user) {
        res.status(500);
        return next();
      }

      res.render('reset-password', {
        token: req.params.token,
        email: user.email
      });
      next();
    });
  });

  app.post('/api/reset-password', (req, res, next) => {
    auth.getUserByToken(req.token, (err, user) => {
      if (err) {
        res.status(500);
        return next();
      }

      auth.setPassword(user.email, req.body.password, (err) => {
        if (err) {
          res.status(500).json({});
        } else {
          res.redirect('/login');
        }
        next();
      });
    });
  });

  // Mount API routes
  app.use('/api', require('./rest').router);
  // Mount view routes
  require('./views');
  // Serve static files
  app.route('*').get(serveStatic);
  app.route('*').get(function(req, res, next) {
    res.type('html');
    res.set('Link', prefetch);
    res.end(base(''));
  });

  var port = 4000
    , options = {
      key: serverConfig.sslKey,
      cert: serverConfig.sslCert
    };
  serverConfig.httpModule.createServer(options, app).listen(port);

  _.each(['HUP', 'INT', 'QUIT', 'TERM'], function(sig) {
    process.on('SIG'+sig, function() {
      require('./bookshelf').db.knex.destroy(function(err) {
        if (err) {
          return console.error(err.message);
        }
        console.log('Terminated knex connection pool');
        process.exit(0);
      });
    });
  });

  console.log('Listening on port ' + 4000);
})();
