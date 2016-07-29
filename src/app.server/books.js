'use strict';

var _ = require('lodash');

var db = require('./bookshelf');


exports.getAll = function getAllBooks(callback) {
  db.models.BookInfo.fetchAll().asCallback(function(err, collection) {
    if (err) return callback(err);

    callback(null, _.map(collection.toJSON(), function(ob) {
      if (ob.title === ob.english_title) {
        delete ob.english_title;
      }

      ob.authors = _.map(
        _.filter(ob.author_info, _.identity), function(author) {
          var arr = author.split(':');
          return {id: Number(arr[0]), name: arr.slice(1).join(':')};
        });
      delete ob.author_info;

      return ob;
    }));
  });
};

exports.getDetails = function getBookDetails(id, callback) {
  db.models.Book.where('id', id).fetch({
    withRelated: ['authors', 'translations', 'volume', 'language']
  }).asCallback(function(err, book) {
    if (err) return callback(err);

    callback(null, book.toJSON());
  });
};
