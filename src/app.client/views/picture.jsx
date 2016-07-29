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

  return <div>
    <h2>{ title }</h2>
    <div class="center-block">
      <img class="center-block"
           src={ `${config.staticRoot}gallery/img/${picture.filename}` }
           alt={ title } />
    </div>
    <div>
      { caption }

      <p class="text-muted text-center" style="margin-top: 5ex;">
        { details }
      </p>
      <p class="text-muted text-center">
        Copyright &copy;1995–2016 Petter Häggholm
      </p>
    </div>
  </div>;
}
