'use strict';

var _ = require('lodash')
  , db = require('./bookshelf')
  , fs = require('fs')
  , express = require('express');
const m = require('mithril');


var books = require('./books');


const cache = {};

const router = express.Router();
const api = module.exports = {};

function asCallback(deferred) {
  return function(err, data) {
    if (err) {
      deferred.reject(err);
    } else {
      deferred.resolve(data);
    }
  }
}



api.gallery = function(filename) {
  const deferred = m.deferred();

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

  if (!filename) {
    getGallery((err, data) => deferred.resolve(data));

  } else {
    getGallery((err, gallery) => {
      for (let i = gallery.length - 1; i >= 0; i--) {
        var row = gallery[i];
        if (row.filename === filename) {
          deferred.resolve(row);
        }
      }

      deferred.reject(new Error(`No such picture: ${filename}`));
    });
  }

  return deferred.promise;
};

api.books = function(id) {
  const d = m.deferred();

  if (!id) {
    books.getAll(asCallback(d));

  } else {
    books.getDetails(id, (err, book) => {
      if (err) return d.reject(err);

      book.hasReview = !!(book.review || book.has_series_review);
      book.isEnglish = book.language.name === 'English';
      book.hasMultipleAuthors = book.authors.length > 1;
      book.translated = !book.read_original;
      book.has_translation_notes = book.isEnglish && book.translations.length ||
                                   !book.isEnglish && book.read_original
      d.resolve(book);
    })
  }

  return d.promise;
};


function responder(res) {
  return [
    (data) => res.json(data).status(200),
    (err) => res.json(err.message).status(500)
  ];
}

router.get('/gallery/picture/:picture', (req, res) => {
  api.gallery(req.params.picture)
     .then(...responder(res));
});
router.get('/gallery', (req, res) => api.gallery().then(...responder(res)));

router.get('/books/:id', (req, res) => {
  api.books(req.params.id).then((data) => sendJSONto(res)(data));
});
router.get('/books', (req, res) => {
  console.log('api.books()');console.log(api.books())
  api.books().then(...responder(res))
});

module.exports.router = router;
