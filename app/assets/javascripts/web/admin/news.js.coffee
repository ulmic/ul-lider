#= require jquery
#= require moment
#= require bootstrap-datetimepicker
#= require text_editor
$ ->
  $('#news_body').editable({ inlineMode: false })
