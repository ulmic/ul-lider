class EventEditByAdminType < Event
  include ApplicationType

  permit :title, :description, :begin_date, :end_date, :place, :participant_count, :goal, :type
end
