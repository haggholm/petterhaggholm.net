'use strict';

var $ = require('jquery')
  , page = require('page')
  , pageExpressMapper = require('page.js-express-mapper.js');

window.jQuery = $;
require('bootstrap');

var routes = require('../app.shared/routes')
  , templates = require('../../build/templates.js');

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

routes.init(window.app);

//window.app.route('/').get(function(req, res) {
//    res.render('home');
//});

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
