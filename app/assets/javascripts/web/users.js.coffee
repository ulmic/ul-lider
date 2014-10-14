$(document).ready ->
  $('#user_municipality').on 'change', ->
    if $(this).val().substring(0, 2) == 'г.'
      $('#user_locality').prop('disabled', true)
      $('#user_locality').val($(this).val())
    else
      $('#user_locality').prop('disabled', false)
      $('#user_locality').val('')
    return
