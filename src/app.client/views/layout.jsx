'use strict';

const m = require('mithril');
const nav = require('./nav');


function initTwitter(el, isInit, context) {
  context.retain = true;

  if (!isInit) {
    m.startComputation();
    const script = document.createElement('script');
    script.src = '//platform.twitter.com/widgets.js';
    script.onload = function() {
      twttr.widgets.load();
      m.endComputation();
    };
    document.body.appendChild(script);
  } else {
    try {
      twttr.widgets.load();
    } catch(e) {
      console.error(e);
    }
  }
}

const twitterEmbed = m('.col-md-2.col-md-offset-1#twitter-embed', {config: initTwitter}, [
  m('.col-md-11', [
    m('h5.center-block', [
      m('a', {href: '//twitter.com/haggholm'}, [
        '@haggholm | Twitter ',
        m('span.fa.fa-twitter')
      ])
    ]),

    m('a.twitter-timeline', {
      href: '//twitter.com/haggholm',
      'data-widget-id': '442835427716632576',
      'data-chrome': 'noheader transparent'
    }, ['Tweets by @haggholm'])
  ])
]);

function track() {
  if (/petterhaggholm\.net/i.test(document.domain)) {
    ga('set', 'page', location.pathname);
    ga('send', 'pageview');
  }
}

exports.view = function(ctrl, mainComponent) {
  return [
    m('nav.navbar.navbar-inverse#navigation', {role: 'navigation', config: track}, [nav]),
    m('main.container-fluid', [
      m('.row', [
        m('.col-md-6.col-md-offset-3', [
          m('.row#main', {role: 'main'}, mainComponent, ctrl)
        ]),

        twitterEmbed
      ])
    ])
  ];
};
