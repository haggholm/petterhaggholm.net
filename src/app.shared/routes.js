'use strict';

var _ = require('lodash');


var routes = {
  '/': function (req, res) {
    res.render('home');
  },
  '/aboutme': function (req, res) {
    res.render('aboutme');
  },
  '/gallery': function (req, res) {
    res.render('aboutme');
  }
};

exports.init = function init(app) {
  _.each(routes, function(handler, pth) {
    app.route(pth).get(handler);
  });
};

exports.routes = _.keys(routes);
