'use strict';

const changeCase = require('change-case');


exports.row = function(id, model, field, opts) {
  const title = opts.title || changeCase.sentenceCase(field);
  const inputType = opts.type || 'text';

  return m('.form-group', [
    m('label.col-sm-2.control-label', {for: `person-${id}-name`}, [title]),
    m('.col-sm-10', [
      m('input.form-control', {
        type: inputType,
        id: `person-${id}-name`,
        value: model[field],
        oninput: m.withAttr('value', model[field])
      })
    ])
  ]);
};
