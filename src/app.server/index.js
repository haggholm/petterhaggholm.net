'use strict';

var _ = require('lodash')
  , async = require('async')
  , express = require('express')
  , glob = require('glob')
  , hogan = require('hogan.js')
  , path = require('path')
  , fs = require('fs')
  , Q = require('q');

var sendFileOr403 = require('./send-file')
  , templates = require('../../build/templates');




// deprecated express methods
// app.use(express.favicon());
// app.use(express.logger('dev'));

var rootPath = path.resolve(path.join(__dirname, '..', '..'))
  , templateRoot = path.join(rootPath, 'src', 'templates');

async.auto({
  indexTemplate: function(cb) {
    fs.readFile(path.join(templateRoot, 'index.hbs'), 'utf8', function(err, data) {
      if (err) {
        return cb(err);
      }

      cb(null, hogan.compile(data));
    });
  },

  navTemplate: function(cb) {
    fs.readFile(path.join(templateRoot, 'nav.hbs'), 'utf8', function(err, data) {
      if (err) {
        return cb(err);
      }

      cb(null, hogan.compile(data));
    });
  },

  clientIndexFile: function(cb) {
    glob.glob(path.join(rootPath, 'build', 'index.*.js'), function(err, data) {
      if (err) {
        return cb(err);
      }

      cb(null, '/' + path.relative(path.join(rootPath, 'build'), data[0]));
    });
  },

  fontAwesomeVersion: function(cb) {
    fs.readFile(
      path.join(rootPath, 'node_modules', 'font-awesome', 'package.json'), 'utf8',
      function(err, data) {
        if (err) {
          return cb(err);
        }

        cb(null, JSON.parse(data).version);
      });
  },

  sslKey: function(cb) {
    var keyFilePath = path.resolve(__dirname, '..', '..', 'sample-keys', 'phnet3.sample.key');
    fs.readFile(keyFilePath, 'utf8', cb);
  },

  sslCert: function(cb) {
    var keyFilePath = path.resolve(__dirname, '..', '..', 'sample-keys', 'phnet3.sample.crt');
    fs.readFile(keyFilePath, 'utf8', cb);
  },

  httpModule: function(cb) {
    cb(null, require('spdy'));
  }
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

  app.engine('hbs', function (filePath, options, callback) {
    var relPath = path.relative(templateRoot, path.normalize(filePath));
    var templateName = relPath.replace(/\.hbs$/, '');

    var render = function() {
      var rendered = indexTemplate.render(_.extend(
        {
          content: templates[templateName].render(options),
          nav: initData.navTemplate.render(options.url)
        },
        indexData
      ));
      callback(null, rendered);
    };

    if (templates[templateName]) {
      process.nextTick(render);

    } else {
      fs.readFile(filePath, function(err, content) {
        if (err) {
          return callback(new Error(err));
        }

        templates[templateName] = hogan.compile(content);
        render();
      });
    }
  });

  app.set('views', templateRoot);
  app.set('view engine', 'hbs');
  app.enable('strict routing');

  app.route('/').get(function (req, res) {
    res.set('Link', [
      '<' + indexData.appEntry + '>; rel=prefetch',
      '</assets/font-awesome.woff2?v=' + indexData.fontAwesomeVersion + '>; rel=prefetch'
    ]);
    res.render('home');
    //if (res.push) {
    //  var headers = { 'Content-type': 'application/javascript' };
    //  res.push(clientAppEntry, headers, function(err, stream) {
    //    stream.on('acknowledge', function() {
    //    });
    //
    //    stream.on('error', function() {
    //    });
    //
    //    stream.end('');
    //  });
    //  res.end('<script src="' + clientAppEntry + '"></script>');
    //}
  });

  require('../app.shared/routes').init(app);

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
  console.log('Listening on port ' + 4000);
});
