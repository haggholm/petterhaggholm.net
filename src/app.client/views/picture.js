'use strict';

const m = require('mithril');
const api = require('../api');
const config = require('../../config');


exports.controller = function() {
  return {
    picture: api.gallery(m.route.param('pic'))
  };
};

exports.view = function(ctrl) {
  const picture = ctrl.picture();
  const caption = m.trust(picture.caption);
  const title = picture.title;
  const details = m.trust(picture.details);

  return {tag: "div", attrs: {}, children: [
    {tag: "h2", attrs: {}, children: [ title ]}, 
    {tag: "div", attrs: {class:"center-block"}, children: [
      {tag: "img", attrs: {class:"center-block", 
           src: (config.staticRoot + "gallery/img/" + picture.filename), 
           alt: title }}
    ]}, 
    {tag: "div", attrs: {}, children: [
       caption, 

      {tag: "p", attrs: {class:"text-muted text-center", style:"margin-top: 5ex;"}, children: [
         details 
      ]}, 
      {tag: "p", attrs: {class:"text-muted text-center"}, children: [
        "Copyright ©1995–2016 Petter Häggholm"
      ]}
    ]}
  ]};
}
