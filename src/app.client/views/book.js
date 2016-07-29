'use strict';

const m = require('mithril');
const _each = require('lodash.foreach');
const _filter = require('lodash.filter');
const _map = require('lodash.map');

const api = require('../api');
const routeController = require('./params');


function tr(title, content) {
  return m('tr', [
    m('th', [title]),
    m('td', content)
  ]);
}

function getTitle(book) {
  return m('h2',
    book.rating ?
      [ratingLink(book.id, book.rating), '&nbsp', book.english_title] :
      [book.english_title]
  );
}

function getVolumes(book) {
  return _map(book.volumes, function(vol)  
    {return m('p', [
      'Book ', vol.volume, ' of ',
      m(("a[href=/series/" + volume.series.id), [series.title]), '.'
    ]);}
  );
}

function getAuthorRow(book) {
  if (book.hasMultipleAuthors) {
    return [
      'Authors',
      [m('ul',
        _map(book.authors, function(a)  
          {return m('li', [m(("a href=[/authors/" + a.id + "]"), [a.full_name])]);}
        )
      )]
    ];

  } else {
    return [
      'Author',
      _map(book.authors, function(a)  
        {return m('li', [m(("a href=[/authors/" + a.id + "]"), [a.full_name])]);}
      )
    ];
  }
}

function getTranslationRows(book) {
  if (!book.translated) {
    return [];
  }

  return [
    tr('Original title', book.title),
    tr('Original language', book.language.name)
  ].concat(_each(book.translations, function(t)  {return [
    'Translation',
    m2('cite', [t.title]),
    'by',
    _map(t.translators, function(tr)  {return tr.full_name;}).join(', ')
  ];}));
}

function getISBNrow(book) {
  return book.any_isbn ? tr('ISBN', book.any_isbn) : [];
}

function getSearchRow(book) {
  return tr('Find it', [
    worldcatSearch(book),
    m('br'),
    gutenbergSearch(book)
  ]);
}

function getShopRow(book) {
  return tr('Buy it', [
    amazonSearch(book),
    m('br'),
    chaptersSearch(book),
    m('br'),
    abeSearch(book)
  ]);
}

function getNotes(book) {
  const res = [];

  if (book.notes) {
    if (book.has_series_notes) {
      res.push(m('h5', ['On', m('cite', [book.english_title])]));
    }
    res.push(book.notes);
  }

  _each(book.volumes, function(v)  {
    if (v.series.notes) {
      res.push(m('h5', [
        'On',
        m(("a href=\"/series/" + v.series.id), [m('cite', v.series.title)])
      ]));
      res.push(v.series.notes);
    }
  });

  if (book.review) {
    if (book.has_series_review) {
      res.push(m('h5', ['Of', m('cite', [book.english_title])]));
    }
    res.push(book.review);
  }

  _each(book.volumes, function(v)  {
    if (v.series.review) {
      res.push(m('h5', [
        'On',
        m(("a href=\"/series/" + v.series.id), [m('cite', v.series.title)])
      ]));
      res.push(v.series.review);
    }
  });

  if (book.has_translation_notes) {
    const bullets = [];

    if (!book.isEnglish && book.translations && !book.read_original) {
      bullets.push(m('li', [
        'I haven’t read the original', book.language.name
      ]));
    } else if (book.read_original) {
      bullets.push(m('li', [
        'I’ve read the original', book.language.name
      ]));
    }

    res.push(
      m('h5', ['Miscellaneous']),
      m('ul.bullets', bullets)
    );
  }

  return res;
}

exports.controller = routeController('id', function(params, done) {
  api.books(params.id, done);
});

exports.view = function(ctrl) {
  const book = ctrl.book;

  return [
    getTitle(book),
    getVolumes(book),
    m('table.table.table-striped', [m('tbody',
      _filter([
        getAuthorRow(book),
        getTranslationRows(book),
        getISBNrow(book),
        getSearchRow(book),
        getShopRow(book),
        tr('Notes', getNotes(book))
      ])
    )])
  ];
};
