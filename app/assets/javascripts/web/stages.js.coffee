#= require jquery

template = (obj) ->
  "<tr>
    <td>
      <img src='https://ulmic.ru/#{obj.small_avatar_url}' />
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
    url: "https://ulmic.ru/api/activity_lines/lider/ya_lider/participants?stage=#{stage}"
    dataType: 'JSON'
    crossDomain: true
    success: (data) ->
      $('#loading').hide()
      $(data).each ->
        obj = JSON.parse this
        $('table#participants tbody tr:last').after template obj
    error: ->
      alert('Ошибка. Пожалуйста, обратитесь к администраторам конкурса по телефону 8 (8422) 96-43-37')
  }
