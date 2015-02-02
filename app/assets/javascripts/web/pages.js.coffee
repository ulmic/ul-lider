$ ->
  if $('#data') != undefined
    $('body').css('background-color', $('#data').attr('data-color'))
    $('h3').css('color', 'white')
    $('h5').css('color', 'white')
    $('h5 a').css('color', 'ffff00')
    $('footer img').css('background-color', '#f0eff4')
