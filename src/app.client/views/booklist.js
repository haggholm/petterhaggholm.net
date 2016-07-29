'use strict';

const m = require('mithril');
const Table = require('sm-table');
const _map = require('lodash.map');

const api = require('../api');
const tags = require('./util/tags');


function setMeta() {
  const link = document.createElement('link');
  link.rel = 'alternate';
  link.type = 'application/rss+xml';
  link.href = '/reviews';
  link.title = 'Book reviews';
  link.id = 'reviews-rss-link';
  document.head.appendChild(link);
}

function removeMeta() {
  const link = document.getElementById('reviews-rss-link');
  if (link) {
    try {
      link.parent.removeChild(link);
    } catch (err) {
      console.error(err);
    }
  }
}


exports.controller = function booklistController(params, done) {
  return {
    books: api.books(),
    onunload: removeMeta
  };
};

exports.view = function(ctrl) {
  // console.log('booklist ctrl', ctrl.books())
  return m('div', {config: setMeta}, [
    m('h2', [
      m('small.pull-right', [
        m('a',
          {href: '/reviews', title: 'RSS feed of my reviews', target: '_blank'},
          [
            m('span.sr-only', ['RSS feed']),
            m('span.fa.fa-rss')
          ])
      ]),
      'Some books I’ve read'
    ]),

    m('div.dynamically-hidden#bookTableContainer',
      { config: function(el)  {return el.className = '';} },
      [m.component(Table, {
        data: ctrl.books(),
        pagination: {
          rowsperpage: 20
        },
        columns: [
          {
            label: 'Title',
            field: 'english_title',
            format: function(english_title, book) {
              if (english_title) {
                return m('ul.list-unstyled', [
                  m('li', [
                    m(("a[href=/books/" + book.id + "]"), [english_title]),
                  ]),
                  m('li.text-muted', [book.title])
                ]);
              } else {
                return m('ul.list-unstyled', [
                  m('li', [
                    m(("a[href=/books/" + book.id + "]"), [book.title]),
                  ])
                ]);
              }
            }
          },
          {
            label: 'Author',
            field: 'authors',
            format: function(authors)  {return tags.authorList(authors);}
            // format: function(authors) {
            //   return m('ul.list-unstyled', _map(authors, (a) => m('li', [a.name])));
            // }
          },
          {
            label: 'Series',
            field: 'volume',
            format: function(volume) {
              return volume ? m('a', [volume.series_title, ' ', volume]) : ''
            }
          },
          {
            label: 'Rating',
            field: 'rating',
            format: function(rating, book)  {return tags.ratingLink(book);}
          }
        ]
      })]
    )
  ])
};
