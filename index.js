'use strict';

require('./src/app.server/index');

//var fs = require('fs')
//  , path = require('path')
//  , util = require('util');
//
//var _ = require('lodash')
//  , hogan = require('hogan.js')
//  , walk = require('walk');
//
//
//function compileTemplates(callback) {
//  var templateRoot = path.resolve(__dirname, 'src', 'templates');
//  var walker = walk.walk(templateRoot, {followLinks: true});
//  var visited = {};
//  var compiledTemplates = {};
//  var abort = false;
//
//  walker.on('file', function(root, fileStat, next) {
//    if (abort) {
//      return next();
//    }
//
//    if (path.extname(fileStat.name) !== '.hbs') {
//      return next();
//    }
//
//    var absPath = path.resolve(root, fileStat.name)
//      , relPath = path.relative(templateRoot, absPath);
//
//    console.log('Processing '+relPath);
//
//    if (visited[absPath]) {
//      console.log('Found a loop in template directories, skipping...');
//      return next();
//    }
//    visited[absPath] = true;
//
//    fs.readFile(absPath, 'utf8', function (err, data) {
//      compiledTemplates[relPath.replace(/\.hbs$/, '')] = hogan.compile(data, {asString: 1});
//      next();
//    });
//  });
//
//  walker.on('end', function() {
//    if (abort) {
//      return;
//    }
//
//    var output = '"use strict";\nvar hogan = require("hogan");\n\n' +
//      'module.exports = {\n';
//    output += _.map(compiledTemplates, function(data, name) {
//      return util.format(
//        '  "%s": new hogan.Template(%s)\n',
//        name.replace('\\', '\\\\').replace('"', '\\"'),
//        data
//      );
//    }).join(',\n');
//
//    output += '\n};\n';
//
//    fs.writeFile('build/templates.js', output, callback);
//  });
//
//  walker.on('error', function(err) {
//    if (abort) {
//      return;
//    }
//
//    abort = true;
//    callback(err);
//  });
//}
//
//function compileLESS(callback) {
//
//}
//
//precompile(function(err) {
//  if (err) {
//    console.error(err.message);
//    throw err;
//  }
//
//  process.exit(0);
//});
