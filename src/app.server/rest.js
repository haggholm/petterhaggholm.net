'use strict';

var _ = require('lodash')
  , express = require('express');

var books = require('./books');


module.exports = express.Router();

module.exports.books = function(callback) {
  books.getAll(callback);
};

_.each(['books'], function(api) {
  module.exports.get('/' + api, function(req, res, next) {
    module.exports[api](function(err, data) {
      if (err) {
        next(); // @TODO
      }

      res.set('Content-type', 'application/json');
      res.send(JSON.stringify(data));
    });
  });
});
