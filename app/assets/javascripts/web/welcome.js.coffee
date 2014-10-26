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
  if $(document).width() >= '767'
    $('.winner_avatar').tooltip({
      html: true,
      content: ->
        return $(this).attr('data-original-title')
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
  $('.winners_images_button').click ->
    if $('.winners_images').is(':visible')
      $('.winner_cell').slideUp()
      $('.winners_images').hide()
    else
      $('.winners_images').show()
      $('.winner_cell').slideDown("slow")
    return
  $('.second').width(screen.width - 67)
  width_of_parent = $('.second').parents('div').first().width()
  margin_left = (width_of_parent - screen.width + 67) / 2
  $('.second').css({
    paddingLeft: -margin_left,
    paddingRight: -margin_left,
    marginLeft: margin_left
  })
  return
