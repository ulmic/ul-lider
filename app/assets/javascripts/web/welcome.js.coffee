winner_id = (element) ->
  $(element).attr('data-winner-id')

close_info = ->
  $('.winner_info').each ->
    if $(this).is(':visible')
      $(this).hide()
      id = $(this).attr('id').substring($(this).attr('id').lastIndexOf('_'))
      $("#winner_avatar#{id}").show()
    return
  return

$(document).ready ->
  if $(document).width() >= '1024'
    $('.winner_avatar').tooltip({
      html: true,
      content: ->
        return $(this).attr('data-original-title')
    })
  else
    $('.winner_avatar.main_avatar').click ->
      close_info()
      id = winner_id this
      $("#winner_info_#{id}").show()
      $(this).hide()
      return
    $('.winner_avatar.in_info').click ->
      id = winner_id this
      $("#winner_avatar_#{id}").show()
      $("#winner_info_#{id}").hide()
  $('.winners_images_button').click ->
    if $('.winners_images').is(':visible')
      $('.winners_images').hide()
    else
      $('.winners_images').show()
    return
  return
