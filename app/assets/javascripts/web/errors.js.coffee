#= require jquery
set_background_color = (color) ->
  $('body').css('background-color', color)
  $('#content').css('background-color', color)
  $('.container').css('background-color', color)

get_view = (hash) ->
  colors = {
    '#view_1': '#f0eff4',
    '#view_2': '#232323',
    '#view_3': '#edcfdb'
  }
  $(hash).show()
  set_background_color colors[hash]
  if hash == '#view_2'
    $('h3').css('color', '#f0eff4')
    $('footer').css('color', '#f0eff4')
    $('footer img').css('background-color', '#f0eff4')
  return

$(document).ready ->
  $('.mr_mrs').hide()
  if window.location.hash != ''
    get_view(window.location.hash)
    return
  else
    i = Math.floor(Math.random() * 3) + 1
    hash = "#view_#{i}"
    get_view(hash)
    return
