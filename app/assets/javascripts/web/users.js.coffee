#= require jquery
#= require i18n_setup
enable_submit = ->
  if ($('#user_creative_work').val() != '' || $('#user_url_creative_work').val() != '') && $('#user_accept_agreement').prop('checked') == true
    $('#send_request').prop('disabled', false)
    $('#user_birth_date').prop('disabled', false)
  else
    $('#send_request').prop('disabled', true)
  return

$(document).ready ->
  if $('#user_url_creative_work').val() != ''
    $('#send_request').prop('disabled', false)
    #it needs because disabled inputs are empty
    $('#user_birth_date').prop('disabled', false)
  else
    $('#send_request').prop('disabled', true)
  $('#user_creative_work').change ->
    enable_submit()
    return
  $('#user_url_creative_work').change ->
    enable_submit()
    return
  $('#user_accept_agreement').change ->
    enable_submit()
    return
  return
