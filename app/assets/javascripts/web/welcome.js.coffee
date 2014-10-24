$(document).ready ->
  $('.winner_avatar').tooltip({
    html: true,
    content: ->
      return $(this).attr('data-original-title')
  })
  $('.winners_images_button').click ->
    if $('.winners_images').is(':visible')
      $('.winners_images').hide()
    else
      $('.winners_images').show()
    return
  return
