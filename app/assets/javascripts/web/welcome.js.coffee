$(document).ready ->
  $('.winner_avatar').tooltip({
    html: true,
    content: ->
      return $(this).attr('data-original-title')
  })
