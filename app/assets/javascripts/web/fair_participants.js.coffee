#= require jquery
$ ->
  if $('#user_accept_agreement').val()
    $('#send_request').prop('disabled', false)
    $('#user_birth_date').prop('disabled', false)
  $('#user_accept_agreement').change ->
    if $(this).prop('checked') == true
      $('#send_request').prop('disabled', false)
      $('#user_birth_date').prop('disabled', false)
    else
      $('#send_request').prop('disabled', true)
    return
