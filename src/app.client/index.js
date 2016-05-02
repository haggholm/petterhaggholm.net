'use strict';

var $ = require('jquery')
  , autotrack = require('autotrack')
  , _extend = require('lodash/extend')
  , page = require('page')
  , pageExpressMapper = require('page.js-express-mapper.js');

window.jQuery = $;
require('bootstrap');

const handlebars = require('handlebars/dist/handlebars.runtime.min.js');
require('../app.shared/template-helpers')(handlebars);
const routes = require('../app.shared/routes')
const templates = require('../../build/templates');

const booklist = require('./booklist');
const login = require('./login');


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

page.exit('/books', function(_1, _2, next) {
  try {
    booklist.exit();
  } catch (err) {
    console.error(err.message, err);
  }

  next();
});

const navBar = $('#navigation');

page.exit('*', function(req, res, next) {
  navBar.find('.active').removeClass('active');
  next();
});


window.app.route('*').get(function(req, res, next) {
  console.info(req.path);
  const anchors = navBar.find('ul > li > a');
  console.log(anchors);
  for (let i = 0; i < anchors.length; i++) {
    const a = anchors[i];
    const href = a.href.startsWith(location.origin) ?
      a.href.substr(location.origin.length) :
      a.href;
    console.log(href);

    if (href !== '/' && req.path.startsWith(href)) {
      console.log(href, 'ok')
      $(a).closest('li').addClass('active');
      return next();
    }
  }

  $('.navbar-header a[href="/"]').addClass('active');
  next();
});

routes.init(window.app, getAPI, window.phnetConfig);



// Activate!
page();


function wrapAnchor(anchor) {
  if (anchor._hrefWrappedByPage) {
    return;
  }

  var href = anchor.href;
  if (routes.routes.indexOf(href) !== -1) {
    $(anchor).click(function(e) {
      page(href);
      e.preventDefault();
    });
    anchor._hrefWrappedByPage = true;
  }
}

/**
 * @param {string} [selector]
 */
function refreshLinks(selector) {
  var anchors = selector ? $(selector).find('a') : $('a');
  anchors.each(wrapAnchor);
}

$(document).ready(function(){
  refreshLinks();
});

if (/petterhaggholm\.net/i.test(document.domain)) {
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
    a = s.createElement(o),
      m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
  })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

  ga('create', window.phnetConfig.gaCode, 'auto');
  ga('require', 'autotrack');
  ga('send', 'pageview');
}
