class EventEditByUserType < Event
  include ApplicationType

  permit :title, :place, :begin_date, :end_date, :description, :user_id
end
