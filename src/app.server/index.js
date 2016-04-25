'use strict';

const _ = require('lodash');
const async = require('async');
const express = require('express');
const glob = require('glob');
const handlebars = require('handlebars');
const path = require('path');
const fs = require('fs');
const bodyParser = require('body-parser');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const session = require('express-session');
const KnexSessionStore = require('connect-session-knex')(session);
const sendFileOr403 = require('./send-file');
const templates = require('../../build/templates');
const helmet = require('helmet');
const multer  = require('multer');
const auth = require('./auth');

require('../app.shared/template-helpers')(handlebars);

// deprecated express methods
// app.use(express.favicon());
// app.use(express.logger('dev'));

var rootPath = path.resolve(path.join(__dirname, '..', '..'))
  , templateRoot = path.join(rootPath, 'src', 'templates');

function readTemplate(name) {
  return function(callback) {
    fs.readFile(
      path.join(templateRoot, name), 'utf8', function(err, data) {
        if (err) {
          return callback(err);
        }

        callback(null, handlebars.compile(data, { min: true }));
      });
  };
}

async.auto({
  indexTemplate: readTemplate('index.hbs'),
  navTemplate: readTemplate('nav.hbs'),

  clientIndexFile: function(cb) {
    glob.glob(path.join(rootPath, 'build', 'index.*.js'), function(err, data) {
      if (err) return cb(err);

      cb(null, '/' + path.relative(path.join(rootPath, 'build'), data[0]));
    });
  },

  fontAwesomeVersion: function(cb) {
    fs.readFile(
      path.join(rootPath, 'node_modules', 'font-awesome', 'package.json'), 'utf8',
      function(err, data) {
        if (err) return cb(err);

        cb(null, JSON.parse(data).version);
      });
  },

  sslKey: function(cb) {
    var keyFilePath = path.resolve(path.join(rootPath, 'sample-keys', 'phnet3.sample.key'));
    fs.readFile(keyFilePath, 'utf8', cb);
  },

  sslCert: function(cb) {
    var keyFilePath = path.resolve(path.join(rootPath, 'sample-keys', 'phnet3.sample.crt'));
    fs.readFile(keyFilePath, 'utf8', cb);
  },

  httpModule: (cb) => cb(null, require('spdy'))
}, function init(err, initData){
  if (err) {
    throw err;
  }

  var indexTemplate = initData.indexTemplate;
  var indexData = {
    appEntry: initData.clientIndexFile,
    fontAwesomeVersion: initData.fontAwesomeVersion
  };

  var app = express();
  app.use(helmet({
    contentSecurityPolicy: require('./content-security-policy')
  }));

  app.engine('hbs', function (filePath, options, callback) {
    var relPath = path.relative(templateRoot, path.normalize(filePath));
    var templateName = relPath.replace(/\.hbs$/, '');
    options.STATIC_URL = '/'; // @TODO

    var render = function() {
      var rendered = indexTemplate(_.extend({
          content: templates[templateName](options),
          nav: initData.navTemplate(options.url)
        },
        indexData
      ));
      callback(null, rendered);
    };

    if (templates[templateName]) {
      process.nextTick(render);

    } else {
      fs.readFile(filePath, 'utf8', function(err, content) {
        if (err) return callback(new Error(err));

        templates[templateName] = handlebars.compile(content);
        render();
      });
    }
  });

  app.set('views', templateRoot);
  app.set('view engine', 'hbs');
  app.enable('strict routing');
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: true }));
  app.route('/').get(function (req, res) {
    res.set('Link', [
      '<' + indexData.appEntry + '>; rel=prefetch',
      '</assets/font-awesome.woff2?v=' + indexData.fontAwesomeVersion + '>; rel=prefetch'
    ]);
    res.render('home');
  });

  app.use(session({
    secret: 'sdfo8*()U(*OIUJLKIU98hdksajw', // @TODO: Config
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

  app.post('/api/login', function(req, res, next) {
    console.log(req);
    console.log(`Trying to login as ${req.body.email}`);
    passport.authenticate('local', function(err, user, info) {
      if (err) {
        console.log(`Error logging in: ${err.message}`, err);
        return res.render('login', {
          error: err.message === 'ERR:RATE' ?
            'Please wait a moment before trying to login again' :
            'Invalid username or password'
        });
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

  function getAPI(pth, callback) {
    const func = require('./rest')[pth];
    if (arguments.length > 2) {
      const args = Array.prototype.slice.call(arguments, 1);
      func.apply(null, args);
    } else {
      return func(function(err, data) {
        callback(err, data);
      });
    }
  }
  require('../app.shared/routes').init(app, getAPI);

  app.use('/api', require('./rest'));

  app.route('*').get(function(req, res, next) {
    var filePath = req.url.replace(/\?.*$/, '');
    var buildPath = path.join(rootPath, 'build', filePath)
      , srcPath = path.join(rootPath, 'src', filePath);

    fs.exists(buildPath, function(exists) {
      if (exists) {
        sendFileOr403(res, buildPath);
      } else {
        fs.exists(srcPath, function(exists) {
          if (exists) {
            sendFileOr403(res, srcPath);
          } else {
            next();
          }
        });
      }
    });
  });

  //app.get('/', function (req, res) {
  //	res.render('list', {examples: examples});
  //});

  var port = 4000
    , options = {
      key: initData.sslKey,
      cert: initData.sslCert
    };
  initData.httpModule.createServer(options, app).listen(port);

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
});
