//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require locales/ru
//= require glyphicons
//= require i18n_setup
//= require froala_editor.min.js
//= require plugins/file_upload.min.js
//= require plugins/font_family.min.js
//= require plugins/tables.min.js
//= require plugins/video.min.js
//= require plugins/lists.min.js
//= require langs/ru.js

$(document).ready(function() {
  $('.datepicker').datetimepicker({
    pickTime: false
  });
  $('.link').click(function() {
    location.href = $(this).attr('data-href');
  });
  $('.target_blank').attr('target', '_blank');
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
