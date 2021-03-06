class ReportCreateType < Event::Report
  include ApplicationType

  permit :title, :place, :begin_date, :end_date, :description, :user_id, :goal, :participant_count, :results, :file, :type
end
