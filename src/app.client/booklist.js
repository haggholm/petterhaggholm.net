'use strict';

var $ = require('jquery');
require('datatables');
require('datatables-bootstrap3-plugin');


var dataTable = null;

exports.init = function() {
  console.log('booklist init');
  var table = $('#bookTable')
    , container = $('#bookTableContainer');
  dataTable = table.DataTable({
    paging: true,
    ordering: true,
    searching: true,
    columnDefs: [
      { width: '40%', targets: [0] },
      { width: '30%', targets: [1] },
      { width: '20%', targets: [2] },
      { width: '10%', targets: [3] }
    ],
    initComplete: function() {
      console.log('booklist init complete');
      container.removeClass('dynamically-hidden');

      container.find('tfoot input').each(function(idx, input) {
        $(input).on('keyup', function() {
          dataTable.column(idx).search(input.value).draw();
        });
      });
    }
  });
};

exports.exit = function() {
  if (dataTable) {
    dataTable.destroy();
    dataTable = null;
  }
};
