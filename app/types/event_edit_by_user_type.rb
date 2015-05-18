class EventEditByUserType < Event
  include ApplicationType

  permit :title, :place, :begin_date, :end_date, :description, :user_id, :goal, :participant_count, :type, :id, :results, :file, :photo, :video, :pluses, :minuses, :most_liked, :can_change, :work_with_command, :resources, :jury, :tasks, :result_participant_count
end
