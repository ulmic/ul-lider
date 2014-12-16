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

initialize_charts = ->
  ctx = document.getElementById("myChart").getContext("2d")
  data = [{
    value: 4,
    color:"#f9bd27",
    highlight: "#f9bd27",
    label: "Идёт"
  },
  {
    value: 2,
    color: "lightgray",
    highlight: "lightgray",
    label: "Осталось"
  }]
  myNewChart = new Chart(ctx).Doughnut(data, { segmentStrokeWidth : 1 })
  return

$(document).ready ->
  document_width = screen.width
  document_height = screen.height
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
    #$ctx = $('#myChart')
    #$ctx.width($(document).width() * 0.4)
    #$ctx.height $ctx.width()
    $('iframe').prop('width', (document_width - 300))
    $('iframe').prop('height', $('iframe').first().width() * 9 / 16)
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
    $('iframe').prop('width', $('iframe').first().parent().first().width())
    $('iframe').prop('height', $('iframe').first().width() * 9 / 16)
  $('.full_width').css('background-size', "#{document_width}px #{document_height}px")
  $('.winners_images_button').click ->
    if $('.winners_images').is(':visible')
      $('.winner_cell').slideUp()
      $('.winners_images').hide()
    else
      $('.winners_images').show()
      $('.winner_cell').slideDown("slow")
    return
  $('#winner_cell_12').unbind('click')
  $('#winner_cell_12').click ->
    close_info()
    id = winner_id this
    $("#winner_info_#{id}").slideDown("show")
    $(this).hide()
    return
  return
