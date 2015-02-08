$ ->
  $('body').append('<div id = "blackout"></div>')
  box_width = 400

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
    $('#popup1').show()
    $('#blackout').show()
    $('html').scrollTop(scrollPos)

  $('[class*=popup]').click (e) ->
    e.stopPropagation()

  $('html').click ->
    scrollPos = $(window).scrollTop()
    $('#popup1').hide()
    $('#blackout').hide()
    $("html,body").css("overflow","auto")
    $('html').scrollTop(scrollPos)

  $('.close').click ->
    scrollPos = $(window).scrollTop()
    $('#popup1').hide()
    $('#blackout').hide()
    $("html,body").css("overflow","auto")
    $('html').scrollTop(scrollPos)

  $(window).resize(centerBox)
  $(window).scroll(centerBox)
  centerBox()
