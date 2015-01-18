#= require jquery
$ ->
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
