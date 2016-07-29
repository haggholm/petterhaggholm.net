'use strict';

const m = require('mithril');
const config = require('../../config');


/** @function */
const header = (function() {
  const toggle = m('button.navbar-toggle',
    {'data-toggle': 'collapse', 'data-target': '#phnet-main-nav'}, [
      m('span.sr-only', ['Toggle navigation']),
      m('span.icon-bar'),
      m('span.icon-bar'),
      m('span.icon-bar')
    ]);

  return function() {
    return m('div.navbar-header', [
      toggle,
      m('a',
        { href: '/',
          config: m.route,
          'class': 'navbar-brand' + (m.route() === '/' ? ' active' : '') },
        ['petterhaggholm.net'])
    ]);
  };
})();


function linkItem(href, iconClass, text) {
  const r = m.route();
  return m('li', {'class': r && r.startsWith(href) ? 'active' : ''}, [
    m('a', {href: href, config: m.route}, [
      m(("i.fa." + iconClass)),
      text
    ])
  ]);
}

const nullLink = 'javascript:void(0)';
const divider = m('li.divider');

function dropdownToggle(title, iconClass) {
  return m('a.dropdown-toggle',
    { 'data-toggle': 'dropdown', title: title, href: nullLink }, [
      m(("i.fa." + iconClass)),
      title,
      m('b.caret')
    ])
}

function extLink(title, iconClass, linkAttrs) {
  if (typeof(linkAttrs) !== 'object') {
    linkAttrs = {href: linkAttrs};
  }
  return m('li', [
    m('a', linkAttrs, [
      m(("i.fa.fa-fw." + iconClass)),
      title
    ])
  ])
}

function menuItem(title, iconClass, linkAttrs) {
  if (typeof(linkAttrs) !== 'object') {
    linkAttrs = {href: linkAttrs};
  }
  linkAttrs.config = m.route;
  return m('li', [
    m('a', linkAttrs, [
      m(("i.fa.fa-fw." + iconClass)),
      title
    ])
  ])
}

exports.view = function(ctrl)  {
  return m('div.container-fluid', [
    header(),

    m('div.collapse.navbar-collapse#phnet-main-nav', [
      m('ul.nav.navbar-nav', [
        linkItem('/aboutme', 'fa-user', 'About me'),
        linkItem('/books', 'fa-book', 'Reading list'),
        linkItem('/gallery', 'fa-picture-o', 'Gallery')
      ]),

      m('ul.nav.navbar-nav.navbar-right', [
        m('li', [
          dropdownToggle('Files', 'fa-download'),
          m('ul.dropdown-menu', [
            m('li.disabled', [
              m('a', {href: nullLink}, ['Download'])
            ]),
            extLink('Résumé', 'fa-download', {
              target: '_blank',
              href: (config.staticRoot + "misc/petter_haggholm_resume.pdf")
            }),
            extLink('PGP public key', 'fa-key', {
              target: '_blank',
              href: (config.staticRoot + "misc/petterhaggholm.net-0x892C8636-pub.asc")
            })
          ])
        ]),

        m('li', [
          dropdownToggle('Links', 'fa-external-link'),
          m('ul.dropdown-menu', [
            extLink('Twitter', 'fa-twitter', 'https://twitter.com/haggholm'),
            extLink('LinkedIn', 'fa-linkedin', 'http://ca.linkedin.com/in/petterhaggholm/'),
            extLink('Facebook', 'fa-facebook', 'https://www.facebook.com/petterhaggholm'),
            extLink('Google+', 'fa-google-plus', 'https://plus.google.com/u/0/+PetterHäggholm/'),
            divider,
            extLink('Blog', 'fa-book', 'http://haggholm.dreamwidth.org/')
          ])
        ]),

        m('li', [
          dropdownToggle('Likes', 'fa-heart-o'),
          m('ul.dropdown-menu', [
            m('li.disabled', [
              m('a', {href: nullLink}, ['Entertainment']),
              extLink('xkcd', 'fa-external-link', {
                href: 'https://xkcd.com/',
                title: 'A webcomic of romance, sarcasm, math, and language.'
              }),
              extLink('Tom Lehrer', 'fa-external-link', {
                href: 'https://www.youtube.com/user/6funswede/videos',
                title: 'The Tom Lehrer Wisdom Channel.'
              }),

              divider,
              m('a', {href: nullLink}, ['Resources']),
              extLink('Stack Overflow', 'fa-stack-overflow', 'https://stackoverflow.com/'),
              extLink('npm', 'fa-external-link', {
                href: 'https://www.npmjs.com/.com/',
                title: 'The Node.js package manager.'
              }),
              extLink('Node.js', 'fa-external-link', 'https://nodejs.org/'),
              extLink('Express', 'fa-external-link', {
                href: 'http://expressjs.com/',
                title: 'Fast, unopinionated, minimalist web framework for Node.js.'
              }),
              extLink('Gulp', 'fa-external-link', {
                href: 'http://gulpjs.com/',
                title: 'The streaming build system'
              }),

              divider,
              m('a', {href: nullLink}, ['Software']),
              extLink('KeePassX', 'fa-lock', {
                href: 'https://www.keepassx.org/',
                title: 'Cross-platform password manager'
              }),
              extLink('Ubuntu GNOME', 'fa-linux', {
                href: 'http://ubuntugnome.org/',
                title: 'All the convenience of Ubuntu, none of the horrors of Unity'
              }),
              extLink('PyCharm', 'fa-external-link', {
                href: 'http://www.jetbrains.com/pycharm/',
                title: 'Python IDE &amp; Django IDE for Web developers'
              })
            ])
          ])
        ])
      ])
    ])
  ]);
};
