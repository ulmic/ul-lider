#= require jquery
#= require i18n_setup

participant_id = (element) ->
  $(element).attr('data-participant-id')

close_info = ->
  $('.participant_info').each ->
    if $(this).is(':visible')
      $(this).hide()
      id = $(this).attr('id').substring($(this).attr('id').lastIndexOf('_'))
      $("#participant_cell#{id}").show()
    return
  return

window.fill_popup = (element) ->
  $popup = $('#popup')
  $data = element.data()
  $('#popup h2.short_name').first().html($data.shortName)
  $('#popup img.img-rounded').first().prop('src', $data.image)
  $('#popup div.age').first().html($data.age)
  $('#popup div.home_city').first().html($data.homeCity)
  $('#popup div.school').first().html($data.school)
  $('#popup div.average').first().html("#{I18n.t('activerecord.attributes.user.average')} #{$data.average}")
  return

open_popup = ->
  fill_popup($("#participant_cell_#{window.location.hash.substring(1)}"))
  $("#popup").show()
  $('#blackout').show()
  scrollPos = $(window).scrollTop()
  $('html').scrollTop(scrollPos)

$(document).ready ->
  document_width = screen.width
  document_height = screen.height
  if $(document).width() >= '991'
    $('.full_width').width(screen.width - 75)
    width_of_parent = $('.full_width').parents('div').first().width()
    margin_left = (width_of_parent - screen.width + 67) / 2
    $('.full_width').css({
      paddingLeft: -margin_left,
      paddingRight: -margin_left - 10,
      marginLeft: margin_left
    })
    $('iframe').prop('width', $('.container').width())
    $('iframe').prop('height', $('iframe').first().width() * 9 / 16)
    if window.location.hash != ''
      open_popup()
  else
    count = $('.news').length
    $('.for_news').height(240 * count)
    $('iframe').prop('width', $('iframe').first().parent().first().width())
    $('iframe').prop('height', $('iframe').first().width() * 9 / 16)
  $('.full_width').css('background-size', "#{document_width}px #{document_height}px")
  $('.participants_images_button').click ->
    if $('.participants_images').is(':visible')
      $('.participant_cell').slideUp()
      $('.participants_images').hide()
    else
      $('.participants_images').show()
      $('.participant_cell').slideDown("slow")
    return
  $('#participant_cell_12').unbind('click')
  $('#participant_cell_12').click ->
    close_info()
    id = participant_id this
    $("#participant_info_#{id}").slideDown("show")
    $(this).hide()
    return
  return
