'use strict';

const fs = require('fs');
const _ = require('lodash');
const app = require('./app');
const config = require('../../config');
const serverConfig = require('./server-config');


const base = (function() {
  const handlebars = require('handlebars');
  const template = handlebars.compile(
    fs.readFileSync(`${__dirname}/../views/index.hbs`, 'utf8'),
    { min: true }
  );

  return function(content) {
    return template({
      appEntry: serverConfig.appEntry,
      fontAwesomeVersion: serverConfig.fontAwesomeVersion,
      content: content,
      // nav: initData.navTemplate(clientConfig),
      // phnetConfig: config
    });
  };
})();


const prefetch = [
  `</${serverConfig.appEntry}>; rel=prefetch`,
  '</assets/index.css>; rel=prefetch',
  `</assets/font-awesome.woff2?v=${serverConfig.fontAwesomeVersion}>; rel=prefetch`
];

const routes = [
  '/',
  '/aboutme',
  '/books',
  '/books/:id',
  '/gallery',
  '/gallery/:pic'
];

_.each(routes, function(route) {
  app.get(route, function(req, res, next) {
    res.type('html');
    res.set('Link', prefetch);
    res.end(base(''));
  });
});
