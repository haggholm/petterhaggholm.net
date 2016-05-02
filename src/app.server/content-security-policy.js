'use strict';

const defaultSrc = ["'self'", '*.petterhaggholm.net'];

module.exports = {
  directives: {
    defaultSrc, // @TODO cfg
    scriptSrc: defaultSrc.concat(
      [
        "'unsafe-inline'",
        'https://*.twitter.com',
        'https://www.google-analytics.com'
      ]),
    imgSrc: defaultSrc.concat(
      [
        'data:',
        'https://www.google-analytics.com',
        'https://*.twimg.com',
        'https://*.twitter.com'
      ]),
    styleSrc: defaultSrc.concat([
      'https://*.twimg.com',
      'https://*.twitter.com',
      "'unsafe-inline'"
    ]),
    childSrc: defaultSrc.concat([
      'https://platform.twitter.com',
      'https://syndication.twitter.com'
    ])
  }
};
