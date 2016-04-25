'use strict';

var _map = require('lodash/map')
  , _each = require('lodash/each')
  , _keys = require('lodash/keys')
  , _chunk = require('lodash/chunk');

var api;

var routes = {
  '/': function (req, res) {
    res.render('home');
  },

  '/aboutme': function(req, res) {
    res.render('aboutme');
  },

  '/gallery': function(req, res) {
    api('gallery', function(err, gallery) {
      const absuri = (url) => ('/' + url);
      let matrix = _map(gallery, function(img) {
        return {
          filename: img.filename,
          thumbnail: absuri('gallery/thumbnails/' + img.filename),
          title: img.title,
          caption: img.caption,
          details: img.details
        };
      });
      matrix = _chunk(matrix, 4);
      res.render('gallery', {matrix: matrix});
    });
  },

  '/books': function(req, res, next) {
    api('books', function(err, data) {

      res.render('booklist', {book_data: data});
    });
  },

  '/books/:id': function(req, res, next) {
    api('books', req.params.id, function(err, data) {
console.log(__filename, 'single book data');
console.log({book: data});
      res.render('book', {book: data});
    });
  },

  '/login': function(req, res, next) {
    res.render('login');
  }
};

exports.init = function init(app, getAPI) {
  api = getAPI;
  _each(routes, function(handler, pth) {
    app.route(pth).get(handler);
  });
};

exports.routes = _keys(routes);
