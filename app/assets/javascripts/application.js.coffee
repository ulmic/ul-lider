#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require jasny-bootstrap/js/fileinput
#= require moment
#= require bootstrap-datetimepicker

$(document).ready ->
  $('.datepicker').datetimepicker({
    pickTime: false
  })
  $('.link').click ->
    location.href = $(this).attr('data-href')
  $('.target_blank').attr('target', '_blank')
  $('.password_reveal').click ->
    e.preventDefault()
    password_input_class = 'password'
    $password_input = $('input.' + password_input_class).first()
    if ($password_input.prop('type') == 'password')
      $password_input.prop('type', 'text')
      $(this).html(I18n.t('javascript.helpers.password_hide'))
    else
      $password_input.prop('type', 'password')
      $(this).html(I18n.t('javascript.helpers.password_reveal'))
  $('textarea').focus( ->
    $(this).height(300)
  ).focusout( ->
    $(this).height(50)
  )
