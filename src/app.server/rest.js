'use strict';

var _ = require('lodash')
  , fs = require('fs')
  , express = require('express');

var books = require('./books');


const cache = {};

module.exports = express.Router();

module.exports.gallery = function(callback) {
  fs.readFile(__dirname + '/gallery.xml', 'utf8', (err, data) => {
    xml2js.parseString(data, (err, ob) => {
      callback(err, ob);
    });
  });
};

module.exports.books = function(callback) {
  if (arguments.length === 1) {
    books.getAll(callback);

  } else {
    const id = arguments[0];
    callback = arguments[1];

    books.getDetails(id, (err, book) => {
      if (err) return callback(err);

      book.hasReview = !!(book.review || book.has_series_review);
      book.isEnglish = book.language.name === 'English';
      book.hasMultipleAuthors = book.authors.length > 1;
      book.translated = !book.read_original;
      book.has_translation_notes = book.isEnglish && book.translations.length ||
                                   !book.isEnglish && book.read_original
      callback(null, book);
    })
  }
};

module.exports.get('/books/:id', function(req, res, next) {
  module.exports.books(req.params.id, function(err, data) {
    res.set('Content-type', 'application/json');
    if (err) {
      res.json(err.message).status(500).end();
      return;
    }

    res.json(data).status(200).end();
  });
});

_.each(['books', 'gallery'], function(api) {
  module.exports.get('/' + api, function(req, res, next) {
    module.exports[api](function(err, data) {
      res.set('Content-type', 'application/json');
      if (err) {
        res.json(err.message).status(500).end();
        return;
      }

      res.json(data).status(200).end();
    });
  });
});
