'use strict';

const m = require('mithril');


module.exports = (ctrl) => (
  <h2>{ ctrl.picture.title }</h2>
  <div class="center-block">
    <img class="center-block" src="{ ctrl.staticRoot }gallery/img/{ ctrl.picture.filename }"
         alt="{ ctrl.picture.title }" />
  </div>
  <div>
    { ctrl.picture.caption }

    <p class="text-muted text-center" style="margin-top: 5ex;">
      { ctrl.picture.details }
    </p>
    <p class="text-muted text-center">
      Copyright &copy;1995–2016 Petter Häggholm
    </p>
  </div>
);
