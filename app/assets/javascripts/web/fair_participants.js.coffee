#= require jquery
open_region_input = ->
  $('div.user_municipality').slideUp()
  $('div.user_region').slideDown()

$ ->
  if $('#user_accept_agreement').prop('checked') == true
    $('#send_request').prop('disabled', false)
    $('#user_birth_date').prop('disabled', false)
  $('#user_accept_agreement').change ->
    if $(this).prop('checked') == true
      $('#send_request').prop('disabled', false)
      $('#user_birth_date').prop('disabled', false)
    else
      $('#send_request').prop('disabled', true)
    return
  $('div.user_region').hide()
  if $('#user_i_am_not_from_73reg').prop('checked') == true
    open_region_input()
  $('#user_i_am_not_from_73reg').change ->
    if $(this).prop('checked') == true
      open_region_input()
    else
      $('div.user_municipality').slideDown('slow')
      $('div.user_region').slideUp('slow')
    return
  return
