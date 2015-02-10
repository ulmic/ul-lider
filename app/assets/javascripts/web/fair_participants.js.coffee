#= require jquery
#= require i18n_setup
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

  $('form.edit_user').hide()
  $('.show-approve-form').click (e) ->
    e.preventDefault()
    $form = $("#edit_user_#{$(this).data().id}")
    if $form.css('display') == 'none'
      $form.show()
      $(this).html(I18n.t('helpers.hide'))
    else
      $form.hide()
      $(this).html(I18n.t('web.fair_participants.users_list.approve_fair_participant'))
  return
