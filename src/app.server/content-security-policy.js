'use strict';

const _ = require('lodash');

const defaultSrc = ["'self'", '*.petterhaggholm.net'];

module.exports = {
  defaultSrc, // @TODO cfg
  scriptSrc: defaultSrc.concat([
    'www.google-analytics.com',
    'https://platform.twitter.com'
  ]),
  imgSrc: defaultSrc.concat([
    'www.google-analytics.com',
    'https://*.twimg.com',
    'https://syndication.twitter.com'
  ]),
  styleSrc: defaultSrc.concat([ 'https://*.twitter.com' ]),
  childSrc: defaultSrc.concat([ 'https://platform.twitter.com' ])
};
