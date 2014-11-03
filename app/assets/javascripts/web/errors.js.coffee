set_background_color = (color) ->
  $('body').css('background-color', color)
  $('#content').css('background-color', color)
  $('.container').css('background-color', color)


$(document).ready ->
  $('.mr_mrs').hide()
  colors = {
    '#view_1': '#f0eff4',
    '#view_2': '#232323',
    '#view_3': '#edcfdb'
  }
  if window.location.hash != ''
    $(window.location.hash).show()
    set_background_color colors[window.location.hash]
    if window.location.hash == '#view_2'
      $('h3').css('color', '#f0eff4')
      $('footer').css('color', '#f0eff4')
      $('footer img').css('background-color', '#f0eff4')
  else
    $('#view_1').show()
    set_background_color colors['#view_1']
