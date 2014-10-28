// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require glyphicons
//= require ckeditor/init
//= require i18n_setup
//
$(document).ready(function() {
  $('.datepicker').datetimepicker({
    pickTime: false
  });
  $('.link').click(function() {
    location.href = $(this).attr('data-href');
  });
  $('.password_reveal').click(function(e) {
    e.preventDefault();
    password_input_class = 'password';
    $password_input = $('input.' + password_input_class).first();
    if ($password_input.prop('type') == 'password') {
      $password_input.prop('type', 'text');
      $(this).html(I18n.t('javascript.helpers.password_hide'));
    } else {
      $password_input.prop('type', 'password');
      $(this).html(I18n.t('javascript.helpers.password_reveal'));
    }
  });
});
