#= require jquery
enable_submit = ->
  if ($('#user_creative_work').val() != '' || $('#user_url_creative_work').val() != '') && $('#user_accept_agreement').prop('checked') == true
    $('#send_request').prop('disabled', false)
  else
    $('#send_request').prop('disabled', true)
  return

$(document).ready ->
  $('#send_request').prop('disabled', true)
  $('#user_birth_date').prop('disabled', true)
  if $('#user_municipality').val().substring(0, 2) == 'г.'
    $('#user_locality').val($('#user_municipality').val())
  $('#user_municipality').on 'change', ->
    if $(this).val().substring(0, 2) == 'г.'
      $('#user_locality').val($(this).val())
    else
      $('#user_locality').val('')
    return
  if $('#user_url_creative_work').val() != ''
    $('#send_request').prop('disabled', false)
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
