module DatesHelper
  def filling_time?
    DateTime.now > configus.dates.start_of_filling &&
      DateTime.now < configus.dates.end_of_filling
  end
end
