$ ->
  $('body').append('<div id = "blackout"></div>')
  box_width = 550
  last_opened_popup = 0

  close_opened_popup = ->
    if last_opened_popup == 0
      last_opened_popup = window.location.hash.substring(1)
    $("#popup#{last_opened_popup}").hide()

  centerBox = ->
    winWidth = $(window).width()
    winHeight = $(document).height()
    scrollPos = $(window).scrollTop()
    disWidth = (winWidth - box_width) / 2
    disHeight = scrollPos + 150
    $('.popup').css({'width' : box_width+'px', 'left' : disWidth+'px', 'top' : disHeight+'px'})
    $('#blackout').css({'width' : winWidth+'px', 'height' : winHeight+'px'})
    return false

  $('.participant_cell').click (e) ->
    e.preventDefault()
    e.stopPropagation()
    name = $(this).attr('class')
    id = name[name.length - 1]
    scrollPos = $(window).scrollTop()
    last_opened_popup = $(this).attr('data-participant-id')
    $("#popup#{$(this).attr('data-participant-id')}").show()
    $('#blackout').show()
    $('html').scrollTop(scrollPos)

  $('[class*=popup]').click (e) ->
    e.stopPropagation()

  $('html').click ->
    scrollPos = $(window).scrollTop()
    close_opened_popup()
    $('#blackout').hide()
    $("html,body").css("overflow","auto")
    $('html').scrollTop(scrollPos)

  $('.close').click ->
    scrollPos = $(window).scrollTop()
    close_opened_popup()
    $('#blackout').hide()
    $("html,body").css("overflow","auto")
    $('html').scrollTop(scrollPos)

  $(window).resize(centerBox)
  $(window).scroll(centerBox)
  centerBox()
