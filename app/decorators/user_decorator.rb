class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.patronymic} #{object.last_name}"
  end

  def place
    "#{object.municipality}, #{object.locality}"
  end

  def school_group
    "#{object.school}, #{object.group}"
  end

  def contacts
    "#{email}, #{mobile_phone}, #{home_phone}"
  end
end
