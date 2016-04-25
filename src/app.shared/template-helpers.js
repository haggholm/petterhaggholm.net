'use strict';

const _each = require('lodash/each');
const _map = require('lodash/map');
const _uniq = require('lodash/uniq');
const printf = require('sprintf-js').sprintf;
const urlencode = require('urlencode');


function _author_list(book, quote) {
  if (quote === undefined) {
    quote = true;
  }

  return _map(
    book.authors,
    quote ? (a) => urlencode(a.full_name) : (a) => a.full_name
  ).join(',');
}


module.exports = function(handlebars) {
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

  handlebars.registerHelper('rating_link', function rating_link(book) {
    if (!book || !book.rating) {
      return '';
    }

    const rating = book.rating;
    const iconClass = rating < 7 ? 'fa-thumbs-down' : 'fa-thumbs-up';
    return safe(
      `<a href="/books/${book.id}" class="fa ${iconClass}"` +
      ` title="${labels[rating]}"></a>`
    );
  });

  handlebars.registerHelper('worldcat_search', function(book) {
    var base, query;
    if (book.oclc) {
      base = 'http://www.worldcat.org/oclc/';
      query = book.oclc;
    } else if (book.english_isbn) {
      base = 'http://www.worldcat.org/search?q=';
      query = `bn:${urlencode(book.english_isbn)}`;
    } else {
      base = 'http://www.worldcat.org/search?q=';
      query = `ti:${urlencode(book.english_title)} au:${_author_list(book, false)}`;
    }

    return safe(`<a href="${base}${query}">WorldCat</a>`);
  });

  handlebars.registerHelper('book_title', function book_title(title, englishTitle) {
    const match = /(.*[^ ]+ [^ ]+): ([^ ]+ [^ ]+ [^ ]+.*)/.exec(englishTitle);
    var formattedTitle;
    if (match) {
      const wordsBefore = match[1];
      const wordsAfter = match[2];
      formattedTitle = `${wordsBefore}:<br />${wordsAfter}`;
    } else {
      formattedTitle = englishTitle;
    }

    if (title !== englishTitle) {
      formattedTitle += ` <span class="text-muted">${title}</span>`;
    }

    return safe(formattedTitle.join(''));
  });

  handlebars.registerHelper('amazon_search', function amazon_search(book) {
    var base, query, tagChar;
    if (book.english_isbn) {
      base = 'http://www.amazon.%s/dp/'
      query = book.english_isbn.replace('-', '').replace(' ', '');
      tagChar = '?'
    } else {
      base = 'http://www.amazon.%s/gp/search/?search-alias=stripbooks&';
      query = `field-title=${urlencode(book.english_title)}&field-author=${_author_list(book)}`;
      tagChar = '&'
    }

    const domains = ['com', 'ca', 'co.uk'];
    const referrals = {
      'com': `${tagChar}tag=petterhaggh07-20`,
      'ca': `${tagChar}tag=petterhagghol-20`,
      'co.uk': ''
    };

    const urls = {};
    _each(domains, (domain) => {
      urls[domain] = `${printf(base, domain)}${query}${referrals[domain]}`;
    });

    return safe(
      `<a href="${urls.com}">Amazon.com</a>|<a href="${urls.ca}">ca</a>|<a href="${urls['co.uk']}">co.uk</a>`
    );
  });

  handlebars.registerHelper('chapters_search', function chapters_search(book) {
    const base = 'http://www.chapters.indigo.ca/books/search/?';
    var query;
    if (book.english_isbn) {
      query = `sc=${book.english_isbn}&sf=ISBN`;
    } else {
      query = `sc=${urlencode(book.english_title)}|${_author_list(book)}&sf=Name|Author`;
    }

    return safe(`<a href="${base}${query}">Chapters.ca</a>`);
  });

  handlebars.registerHelper('abe_search', function abe_search(book) {
    const base = 'http://www.abebooks.com/servlet/SearchResults?';
    const query = book.english_isbn ?
      `isbn=${book.english_isbn}` :
      `an=${_author_list(book)}&tn=${urlencode(book.english_title)}`;

    return safe(`<a href="${base}${query}">AbeBooks</a>`);
  });

  handlebars.registerHelper('gutenberg_search', function gutenberg_search(book) {
    const authorQuery = '(' + _map(
      book.authors,
      (a) => `a.${a.full_name}`
    ).join(' | ') + ')';
    const titleQuery = '(' + _map(
      _uniq([book.title, book.english_title]).concat(_map(book.translations, 'title')),
      (t) => `t.${t}`
    ).join(' | ') + ')';

    return safe(
      `<a href="https://www.gutenberg.org/ebooks/search/?` +
      `query=${urlencode(titleQuery)}+${authorQuery}">Project Gutenberg</a>`
    );
  });

  function and_list(list) {
    const len = list.length;
    switch (len) {
      case 0:
        return '';
      case 1:
        return list[0];
      case 2:
        return `${list[0]} and ${list[1]}`;
      default:
        return list.slice(0, len - 1).join(', ') + list[len - 1];
    }
  }
  handlebars.registerHelper('and_list', and_list);

  handlebars.registerHelper('author_list', function(authors) {
    return and_list(
      _map(authors, (a) => `<a href="/authors/${a.id}">${a.full_name}</a>`)
    );
  });

  handlebars.registerHelper('strip_the', function strip_the(str) {
    return /the /i.test(str) ? str.substr(4) : str;
  });

  handlebars.registerHelper('has_translation_notes', function has_translation_notes(book) {
    return book.isEnglish && book.translations.count ||
           !book.isEnglish && book.read_original;
  });
};
