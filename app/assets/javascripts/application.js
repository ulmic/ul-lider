//= require moment
//= require jquery
//= require jquery_ujs
//= require bootstrap-datetimepicker
//= jasny_file_uploader

$(document).ready(function() {
  $('.datepicker').datetimepicker({
    pickTime: false
  });
  $('.datetimepicker').datetimepicker();
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
