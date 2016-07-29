'use strict';

const m = require('mithril');
const form = require('../util/form');
const models = require('../util/models');


exports.controller = function(args) {
  this.book = m.prop(args.book || new models.Book());
};

exports.view = function(ctrl) {
  const book = ctrl.book();
  const id = book.id || `x{(Date.now() + Math.random)}`;

  return m('div', [
    form.row(id, book, 'isbn', { title: 'ISBN' }),
    form.row(id, book, 'oclc', { title: 'OCLC' }),
    form.row(id, book, 'title'),
    form.row(id, book, 'english_title'),
    form.row(id, book, 'sort_title'),
    form.row(id, book, 'read_original', 'radio'),
    form.row(id, book, 'rating'),
    form.row(id, book, 'review'),
    form.row(id, book, 'notes'),
    form.row(id, book, 'language'),
    form.row(id, book, 'owned', 'radio')
  ]);
};
