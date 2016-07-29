'use strict';


exports.init = function() {
  console.log('login init');
  $('#login-forgot').click(function(evt) {
    evt.preventDefault();
    $.ajax({
      method: 'post',
      data: { email: $('#login-email').val() },
      url: '/api/generate-token',
      success: function (data, status) {
        console.info('Generated token');
      },
      error: function () {
        console.error(arguments);
      }
    });
  });
};

exports.exit = function() {

};
