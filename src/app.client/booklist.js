'use strict';

var $ = require('jquery');
require('datatables');
require('datatables-bootstrap3-plugin');

exports.init = function() {
  console.log('booklist init');
  var table = $('#bookTable')
    , container = $('#bookTableContainer');
  table.DataTable({
    paging: true,
    ordering: true,
    initComplete: function() {
      console.log('booklist init complete');
      container.removeClass('dynamically-hidden');
    }
  });
};
