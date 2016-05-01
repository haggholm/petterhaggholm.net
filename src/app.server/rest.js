'use strict';

var _ = require('lodash')
  , db = require('./bookshelf')
  , fs = require('fs')
  , express = require('express');

var books = require('./books');


const cache = {};

module.exports = express.Router();


module.exports.gallery = function(callback) {
  var getGallery;
  if (cache.gallery) {
    getGallery = (cb) => cb(null, cache.gallery);
  } else {
    getGallery = (cb) => db.models.Artwork.fetchAll().asCallback(
      (err, gallery) => {
        if (err) return cb(err);
        cb(null, (cache.gallery = gallery.toJSON()));
      });
  }

  if (arguments.length === 1) {
    getGallery(callback);

  } else {
    const filename = arguments[0];
    callback = arguments[1];

    getGallery((err, gallery) => {
      for (let i = gallery.length - 1; i >= 0; i--) {
        var row = gallery[i];
        if (row.filename === filename) {
          return callback(null, row);
        }
      }

      return callback(new Error(`No such picture: ${filename}`));
    });
  }
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

module.exports.get('/gallery/:picture', function(req, res) {
  module.exports.gallery(req.params.picture, function(err, data) {
    res.set('Content-type', 'application/json');
    if (err) {
      res.json(err.message).status(500);
      return;
    }

    res.json(data).status(200);
  });
});


module.exports.get('/books/:id', function(req, res) {
  module.exports.books(req.params.id, function(err, data) {
    res.set('Content-type', 'application/json');
    if (err) {
      res.json(err.message).status(500);
      return;
    }

    res.json(data).status(200);
  });
});

_.each(['books', 'gallery'], function(api) {
  module.exports.get('/' + api, function(req, res) {
    module.exports[api](function(err, data) {
      res.set('Content-type', 'application/json');
      if (err) {
        res.json(err.message).status(500);
        return;
      }

      res.json(data).status(200);
    });
  });
});
