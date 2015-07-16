'use strict';

var $ = require('jquery')
  , page = require('page')
  , pageExpressMapper = require('page.js-express-mapper.js');

window.jQuery = $;
require('bootstrap');

var routes = require('../app.shared/routes')
  , templates = require('../../build/templates.js');
var booklist = require('./booklist');

window.page = page;

pageExpressMapper({
  renderMethod: function(template, model) {
    model = model || {};
    var targetElement = model.targetSelector
      ? document.querySelector(model.targetSelector)
      : document.getElementById('main');
    targetElement.innerHTML = templates[template].render(model);
    refreshLinks(targetElement);
  },

  expressAppName: 'app'
});

function getAPI(pth, callback) {
  $.ajax({
    url: '/api/' + pth,
    success: function(data, status) {
      callback(null, data);
    }
  });
}


routes.init(window.app, getAPI);
window.app.route('/books').get(function(req, res, next) {
  booklist.init();
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


