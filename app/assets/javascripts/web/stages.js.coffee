#= require jquery

template = (obj) ->
  "<tr>
    <td>
      <img src='#{obj.small_avatar_url}' />
    </td>
    <td>
      <span>
        #{obj.name}
      </span>
    </td>      
    <td>
      <span>
        #{obj.municipality}
      </span>
    </td>
  </tr>"

$ ->
  stage = window.location.pathname[8]
  $.ajax {
    #url: "https://ulmic.ru/api/activity_lines/lider/ya_lider/participants?scope=active"
    url: "http://localhost:3000/api/activity_lines/lider/ya_lider/participants?stage=#{stage}"
    dataType: 'JSON'
    crossDomain: true
    success: (data) ->
      $('#loading').hide()
      $(data).each ->
        obj = JSON.parse this
        $('table#participants tbody tr:last').after template obj
  }
