'use strict';

var path = require('path');

var _ = require('lodash');

var baseDir = path.resolve(__dirname, '..', '..');

var allowedBaseDirs = [
  path.resolve(path.join(baseDir, 'build')),
  path.resolve(path.join(__dirname, '..', 'js')),
  path.resolve(path.join(__dirname, '..', 'css'))
];
var longestRootLength = _.max(_.map(allowedBaseDirs, 'length'));



module.exports = function sendFileOr403(res, pth) {
  var leadingPath = pth.substr(0, longestRootLength);

  var isBaseOfFile = function(baseDir) {
    return pth.startsWith(baseDir);
  };

  if (!_.some(allowedBaseDirs, isBaseOfFile)) {
    res.status(403); // @TODO Lookup proper method, doi
  } else {
    res.sendFile(pth);
  }
};
