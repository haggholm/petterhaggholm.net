'use strict';

const m = require('mithril');
const form = require('../util/form');
const models = require('../util/models');


exports.controller = function(args) {
  this.author = m.prop(args.author || new models.Author());
};

exports.view = function(ctrl) {
  const author = ctrl.author();
  const id = author.id || `x{(Date.now() + Math.random)}`;

  return m('div', [
    form.row(id, author, 'full_name'),
    form.row(id, author, 'list_name'),
    form.row(id, author, 'first_name'),
    form.row(id, author, 'last_name'),
    form.row(id, author, 'middle_name')
  ]);
};
