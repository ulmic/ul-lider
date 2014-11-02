winner_id = (element) ->
  $(element).attr('data-winner-id')

close_info = ->
  $('.winner_info').each ->
    if $(this).is(':visible')
      $(this).hide()
      id = $(this).attr('id').substring($(this).attr('id').lastIndexOf('_'))
      $("#winner_cell#{id}").show()
    return
  return

$(document).ready ->
  if $(document).width() >= '991'
    $('.winner_avatar').tooltip({
      html: true,
      content: ->
        return $(this).attr('data-original-title')
    })
    $('.full_width').width(screen.width - 75)
    width_of_parent = $('.full_width').parents('div').first().width()
    margin_left = (width_of_parent - screen.width + 67) / 2
    $('.full_width').css({
      paddingLeft: -margin_left,
      paddingRight: -margin_left - 10,
      marginLeft: margin_left
    })
  else
    $('.winner_cell.main_avatar').click ->
      close_info()
      id = winner_id this
      $("#winner_info_#{id}").slideDown("show")
      $(this).hide()
      return
    $('.winner_avatar.in_info').click ->
      id = winner_id this
      $("#winner_cell_#{id}").slideDown("show")
      $("#winner_info_#{id}").slideUp("hide")
    count = $('.news').length
    $('.for_news').height(240 * count)
  $('.winners_images_button').click ->
    if $('.winners_images').is(':visible')
      $('.winner_cell').slideUp()
      $('.winners_images').hide()
    else
      $('.winners_images').show()
      $('.winner_cell').slideDown("slow")
    return
  $('.full_width').width(document.width)
  margin_left = (1170 - document.width) / 2
  $('.full_width').css({
    paddingLeft: -margin_left,
    paddingRight: -margin_left,
    marginLeft: margin_left
  })
  $('#winner_cell_12').unbind('click')
  $('#winner_cell_12').click ->
    close_info()
    id = winner_id this
    $("#winner_info_#{id}").slideDown("show")
    $(this).hide()
    return
  return
