'use strict';

var path = require('path');

var _ = require('lodash');

var baseDir = path.resolve(__dirname, '..', '..');

var allowedBaseDirs = [
  path.resolve(path.join(__dirname, '..', '..', 'build')),
  path.resolve(path.join(__dirname, '..', 'js')),
  path.resolve(path.join(__dirname, '..', 'css'))
];
var longestRootLength = _.max(_.pluck(allowedBaseDirs, 'length'));



module.exports = function sendFileOr403(res, pth) {
  var leadingPath = pth.substr(0, longestRootLength);

  var isBaseOfFile = function(baseDir) {
    return pth.startsWith(baseDir);
  };

  if (!_.any(allowedBaseDirs, isBaseOfFile)) {
    res.status(403); // @TODO Lookup proper method, doi
  } else {
    res.sendFile(pth);
  }
};
