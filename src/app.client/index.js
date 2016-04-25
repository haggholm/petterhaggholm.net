'use strict';

var $ = require('jquery')
  , _extend = require('lodash/extend')
  , page = require('page')
  , pageExpressMapper = require('page.js-express-mapper.js');

window.jQuery = $;
require('bootstrap');

var routes = require('../app.shared/routes')
  , templates = require('../../build/templates');

var booklist = require('./booklist');
var login = require('./login');

const handlebars = require('handlebars/dist/handlebars.runtime.min.js');
require('../app.shared/template-helpers')(handlebars);

const pages = {
  booklist: booklist,
  login: login
};

window.page = page;

pageExpressMapper({
  renderMethod: function(template, model) {
    console.log('Render ' + template);
    model = _extend(model || {}, {'_': ''});
    var targetElement = model.targetSelector ?
      document.querySelector(model.targetSelector) :
      document.getElementById('main');

    model.STATIC_URL = '/'; // @TODO
    targetElement.innerHTML = templates[template + '.js'](model);
    refreshLinks(targetElement);

    if (pages[template] && pages[template].init) {
      console.log('Initialise ' + template);
      pages[template].init();
    }
  },

  expressAppName: 'app'
});

function getAPI(pth, callback) {
  callback = arguments[arguments.length - 1];

  const args = Array.prototype.slice.call(arguments, 0, arguments.length -1);
  const key = JSON.stringify(args);
  if (getAPI._cache[key]) {
    return callback(null, getAPI._cache[key]);
  }

  $.ajax({
    url: '/api/' + args.join('/'),
    success: function(data, status) {
      getAPI._cache[key] = data;
      callback(null, data);
    },
    error: function() {
      console.error(arguments);
    }
  });
}
getAPI._cache = {};


routes.init(window.app, getAPI);

page.exit('/books', function(_1, _2, next) {
  try {
    booklist.exit();
  } catch (err) {
    console.error(err.message, err);
  }

  next();
});


// Activate!
page();


/**
 * @param {string} [selector]
 */
function refreshLinks(selector) {
  var anchors = selector ? $(selector).find('a') : $('a');
  anchors.each(function() {
    if (this._hrefWrappedByPage) {
      return;
    }

    var href = this.href;
    if (routes.routes.indexOf(href) !== -1) {
      $(this).click(function(e){
        page(href);
        e.preventDefault();
      });
      this._hrefWrappedByPage = true;
    }
  });
}

$(document).ready(function(){
  refreshLinks();
});


