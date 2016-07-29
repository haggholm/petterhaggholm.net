'use strict';

const m = require('mithril');
const _each = require('lodash.foreach');
const _map = require('lodash.map');
const _uniq = require('lodash.uniq');
const printf = require('sprintf-js').sprintf;
const urlencode = require('urlencode');


function _author_list(book, quote) {
  if (quote === undefined) {
    quote = true;
  }

  return _map(
    book.authors,
    quote ?
      function(a) { return urlencode(a.full_name); } :
      function(a) { return a.full_name; }
  ).join(',');
}


function safe(str) {
  return new handlebars.SafeString(str);
}

const labels = {
  1: 'awful',
  2: 'awful',
  3: 'bad',
  4: 'bad',
  5: 'mediocre',
  6: 'mediocre',
  7: 'good',
  8: 'good',
  9: 'great',
  10: 'great'
};

exports.ratingLink = (book) => {
  if (!book || !book.rating) {
    return '';
  }

  const rating = book.rating;
  const iconClass = rating < 7 ? 'fa-thumbs-down' : 'fa-thumbs-up';
  return m('a', {
    'class': `fa ${iconClass}`,
    href: `/books/${book.id}`,
    title: labels[rating]
  });
};

exports.worldcatSearch = (book) => {
  var base, query;
  if (book.oclc) {
    base = 'http://www.worldcat.org/oclc/';
    query = book.oclc;
  } else if (book.english_isbn) {
    base = 'http://www.worldcat.org/search?q=';
    query = 'bn:' + urlencode(book.english_isbn);
  } else {
    base = 'http://www.worldcat.org/search?q=';
    query = 'ti:' + urlencode(book.english_title) + ' au:' + _author_list(book, false);
  }

  return m('a', { href: + base + query }, ['WorldCat']);
};

exports.bookTitle = function bookTitle(title, englishTitle) {
  const match = /(.*[^ ]+ [^ ]+): ([^ ]+ [^ ]+ [^ ]+.*)/.exec(englishTitle);
  var formattedTitle;
  if (match) {
    const wordsBefore = match[1];
    const wordsAfter = match[2];
    formattedTitle = [wordsBefore + m('br'), wordsAfter];
  } else {
    formattedTitle = [englishTitle];
  }

  if (title !== englishTitle) {
    formattedTitle.push(' ', m('span.text-muted', [title]));
  }

  return formattedTitle;
};

exports.amazonSearch = function amazonSearch(book) {
  var base, query, tagChar;
  if (book.english_isbn) {
    base = 'http://www.amazon.%s/dp/'
    query = book.english_isbn.replace('-', '').replace(' ', '');
    tagChar = '?'
  } else {
    base = 'http://www.amazon.%s/gp/search/?search-alias=stripbooks&';
    query = 'field-title='+urlencode(book.english_title)+'&field-author='+_author_list(book);
    tagChar = '&'
  }

  const domains = ['com', 'ca', 'co.uk'];
  const referrals = {
    'com': tagChar + 'tag=petterhaggh07-20',
    'ca': tagChar + 'tag=petterhagghol-20',
    'co.uk': ''
  };

  const urls = {};
  _each(domains, function(domain) {
    return urls[domain] = printf(base, domain) + query + referrals[domain];
  });

  return [
    m('a', {href: urls.com}, ['Amazon.com']),
    '|',
    m('a', {href: urls.ca}, ['ca']),
    '|',
    m('a', {href: urls['co.uk']}, ['co.uk'])
  ];
};

exports.chaptersSearch = function chaptersSearch(book) {
  const base = 'http://www.chapters.indigo.ca/books/search/?';
  var query;
  if (book.english_isbn) {
    query = 'sc='+book.english_isbn+'&sf=ISBN';
  } else {
    query = 'sc='+urlencode(book.english_title)+'|'+_author_list(book)+'&sf=Name|Author';
  }

  return m('a', { href: base + query }, ['Chapters.ca']);
};

exports.abeSearch = function abe_search(book) {
  const base = 'http://www.abebooks.com/servlet/SearchResults?';
  const query = book.english_isbn ?
    `isbn=${ book.english_isbn }` :
    `an=${ _author_list(book) }&tn=${ urlencode(book.english_title) }`;

  return m('a', { href: base+query }, ['AbeBooks']);
};

exports.gutenbergSearch = function gutenbergSearch(book) {
  const authorQuery = '(' + _map(
      book.authors,
      function(a) { return 'a.'+a.full_name; }
    ).join(' | ') + ')';
  const titleQuery = '(' + _map(
      _uniq([book.title, book.english_title]).concat(_map(book.translations, 'title')),
      function(t) { return 't.' + t; }
    ).join(' | ') + ')';

  return m('a', {
    href: 'https://www.gutenberg.org/ebooks/search/?' +
          `query=${ urlencode(titleQuery) }+${ authorQuery }`
  });
};

function andList(list) {
  const len = list.length;
  switch (len) {
    case 0:
      return '';
    case 1:
      return list[0];
    case 2:
      return list[0] + ' and ' + list[1];
    default:
      return list.slice(0, len - 1).join(', ') + list[len - 1];
  }
}
exports.andList = andList;

exports.authorList = function(authors) {
  let hasFullNames = false;
  authors = _map(authors,
    (a) => {
      if (a.full_name) {
        hasFullNames = true;
      }
      return m('a', { href: `/authors/${a.id}`, config: m.route }, [a.full_name || a.name])
    });
  const len = authors.length;
  switch (len) {
    case 0:
      return [];
    case 1:
      return authors[0];
    case 2:
      return [authors[0], ' and '].concat(authors.slice(1));
    default:
      const sep = hasFullNames ? ', ' : '; '
      const res = new Array(len * 2);
      for (let i = 0; i < len - 1; i+=2) {
        res[i] = authors[i];
        res[i+1] = sep;
      }
      res[2 * len - 2] = ' and ';
      res[2 * len - 1] = authors[len - 1];
      return res;
  }
};

exports.stripThe = function stripThe(str) {
  return /the /i.test(str) ? str.substr(4) : str;
};

exports.hasTranslationNotes = function hasTranslationNotes(book) {
  return book.isEnglish && book.translations.count ||
         !book.isEnglish && book.read_original;
};

