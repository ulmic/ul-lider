$ ->
  $.ajax {
    url: "https://ulmic.ru/api/activity_lines/lider/ya_liders/2"
    dataType: 'JSON'
    crossDomain: true
    success: (data) ->
      $('#content').html data.provision
    error: ->
      alert('Ошибка. Пожалуйста, обратитесь к администраторам конкурса по телефону 8 (8422) 96-43-37')
  }
