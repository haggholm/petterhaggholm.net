'use strict';

var _ = require('lodash');

var getAPIFunc;

var routes = {
  '/': function (req, res) {
    res.render('home');
  },
  '/aboutme': function(req, res) {
    res.render('aboutme');
  },
  '/gallery': function(req, res) {
    res.render('aboutme');
  },
  '/books': function(req, res, next) {
    getAPIFunc('books', function(err, data) {
      res.render('booklist', {book_data: data});
      next();
    });
  }
};

exports.init = function init(app, getAPI) {
  getAPIFunc = getAPI;
  _.each(routes, function(handler, pth) {
    app.route(pth).get(handler);
  });
};

exports.routes = _.keys(routes);
