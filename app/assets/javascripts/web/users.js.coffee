#= require jquery
#= require i18n_setup
enable_submit = ->
  if ($('#user_creative_work').val() != '' || $('#user_url_creative_work').val() != '') && $('#user_accept_agreement').prop('checked') == true && $('#user_accept_personal_data_actions').prop('checked') == true
    $('#send_request').prop('disabled', false)
    $('#user_birth_date').prop('disabled', false)
  else
    $('#send_request').prop('disabled', true)
  return

$ ->
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
  $('#user_accept_personal_data_actions').change ->
    enable_submit()
    return
  $('#submit_check_code').prop 'disabled', true
  $('#user_email').on 'change', ->
    $('#promocode_email').val $(this).val()
    unless $(this).val() == ''
      $('#submit_check_code').prop 'disabled', false
  $('#check_code').on('ajax:error', (->
    $('.success').addClass 'hidden'
    $('.hidden.error').removeClass 'hidden')
  ).on 'ajax:success', ->
    $('.hidden.success').removeClass 'hidden'
    $('error').addClass 'hidden'
  return
