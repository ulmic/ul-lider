enable_submit = ->
  if $('#user_creative_work').val() != '' || $('#user_creative_work_url').val() != ''
    $('#send_request').prop('disabled', false)
  else
    $('#send_request').prop('disabled', true)
  return

$(document).ready ->
  if $('#user_municipality').val().substring(0, 2) == 'г.'
    $('#user_locality').val($('#user_municipality').val())
  $('#user_municipality').on 'change', ->
    if $(this).val().substring(0, 2) == 'г.'
      $('#user_locality').val($(this).val())
    else
      $('#user_locality').val('')
    return
  $('#send_request').prop('disabled', true)
  $('#user_creative_work').on 'change', ->
    enable_submit()
    return
  $('#user_creative_work_url').on 'change', ->
    enable_submit()
    return
