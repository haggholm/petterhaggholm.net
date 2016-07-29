'use strict';

const m = require('mithril');
const layout = require('../views/layout');


module.exports = {
  '/':                m.component(layout, require('../views/home')),
  '/aboutme':         m.component(layout, require('../views/aboutme')),
  '/books':           m.component(layout, require('../views/booklist')),
  '/books/:id':       m.component(layout, require('../views/book')),
  '/gallery':         m.component(layout, require('../views/gallery')),
  '/gallery/:pic...': m.component(layout, require('../views/picture'))
};
