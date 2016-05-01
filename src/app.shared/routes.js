'use strict';

var _each = require('lodash/each')
  , _extend = require('lodash/extend')
  , _keys = require('lodash/keys');

var api;

var defaultArgs;

var routes = {
  '/': function (req, res) {
    res.render('home', defaultArgs);
  },

  '/aboutme': function(req, res) {
    res.render('aboutme', defaultArgs);
  },

  '/gallery': function(req, res) {
    api('gallery', function(err, gallery) {
      res.render('gallery', _extend({}, defaultArgs, {gallery: gallery}));
    });
  },
  '/gallery/picture/:filename': function(req, res) {
    api('gallery', req.params.filename, function(err, picture) {
      res.render('picture', _extend({}, defaultArgs, {picture: picture}));
    });
  },

  '/books': function(req, res, next) {
    api('books', function(err, data) {

      res.render('booklist', _extend({}, defaultArgs, {book_data: data}));
    });
  },
  '/books/:id': function(req, res, next) {
    api('books', req.params.id, function(err, data) {
      res.render('book', _extend({}, defaultArgs, {book: data}));
    });
  },

  '/login': function(req, res, next) {
    res.render('login', defaultArgs);
  }
};

exports.init = function init(app, getAPI, cfg) {
  api = getAPI;
  console.log(cfg);
  defaultArgs = cfg;
  _each(routes, function(handler, pth) {
    app.route(pth).get(handler);
  });
};

exports.routes = _keys(routes);
