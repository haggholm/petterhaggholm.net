'use strict';

const m = require('mithril');
const _map = require('lodash.map');
const api = require('../api');

const config = require('../../config');

function pic(imgInfo) {
  return m('div.piece', [
    m(`a[href=/gallery/picture/${imgInfo.filename}]`, {config: m.route}, [
      m(`img.thumb[src=${config.staticRoot}${imgInfo.thumbnail}][alt="Thumbnail: ${imgInfo.title}"]`)
    ]),
    m('br'),
    m('em', [imgInfo.title])
  ]);
}


exports.controller = function(args) {
  return {
    gallery: api.gallery()
  };
};


exports.view = function(ctrl) {
  return m('div.data-ui-view', [
    m('div.col-md-8.col-md-offset-2', [
      m('div.row', [
        m('div.col-md-12.col-sm-12#gallery-container',
          _map(ctrl.gallery(), pic))
      ])
    ])
  ])
};
