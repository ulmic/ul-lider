$ ->
  $('#add_participant').click (e) ->
    e.preventDefault()
    id = $('.form-group').last().children('input').attr('id').match /[0-9]/
    id = parseInt(id) + 1
    report_id = $('input[type=hidden]').last().val()
    $("
    <div class=\"form-group string required event_report_participants_first_name\"><input class=\"string required form-control\" id=\"event_report_participants_attributes_#{id}_first_name\" name=\"event_report[participants_attributes][#{id}][first_name]\" placeholder=\"Имя\" type=\"text\" value=\"\" /></div>
    <div class=\"form-group string required event_report_participants_last_name\"><input class=\"string required form-control\" id=\"event_report_participants_attributes_#{id}_last_name\" name=\"event_report[participants_attributes][#{id}][last_name]\" placeholder=\"Фамилия\" type=\"text\" value=\"\" /></div>
    <div class=\"form-group string required event_report_participants_phone\"><input class=\"string required form-control\" id=\"event_report_participants_attributes_#{id}_phone\" name=\"event_report[participants_attributes][#{id}][phone]\" placeholder=\"Номер телефона\" type=\"text\" value=\"\" /></div>
    <input id=\"event_report_participants_attributes_#{id}_id\" name=\"event_report[participants_attributes][#{id}][id]\" type=\"hidden\" value=\"#{report_id}\" />
    <hr>").insertAfter($('form hr').last())
    return
  return
