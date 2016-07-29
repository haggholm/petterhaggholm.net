'use strict';

window.$ = window.jQuery = require('jquery/dist/jquery.slim.min');
const m = require('mithril');
require('bootstrap');
require('autotrack');

const config = require('../../config');
const routes = require('./routes');


function initTwitterEmbed() {
  window.twttr = (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0],
      t = window.twttr || {};
    if (d.getElementById(id)) return t;
    js = d.createElement(s);
    js.id = id;
    js.src = 'https://platform.twitter.com/widgets.js';
    fjs.parentNode.insertBefore(js, fjs);

    t._e = [];
    t.ready = function(f) {
      t._e.push(f);
    };

    return t;
  }(document, 'script', 'twitter-wjs'));
}

function initAnalytics() {
  if (!window.ga) {
    window.ga = window.ga || function () {(ga.q = ga.q || []).push(arguments)};
    ga.l = +new Date;
  }
  ga('create', config.gaCode, 'auto');
}

function initApp() {
  m.route.mode = 'pathname';
  m.route(document.body, '/', routes);
}


window.onload = function() {
  initApp();
  initTwitterEmbed();
  initAnalytics();
};
