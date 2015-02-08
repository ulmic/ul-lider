class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.patronymic} #{object.last_name}"
  end

  def short_name
    "#{object.first_name} #{object.last_name}"
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

  def age
    now = Time.now.utc.to_date
    years = now.year - object.birth_date.year - ((now.month > object.birth_date.month || (now.month == object.birth_date.month && now.day > object.birth_date.day)) ? 0 : 1)
    "#{years} #{Russian.p(years, 'год', 'года', 'лет')}"
  end

  def formated_birth_date
    if birth_date
      birth_date.strftime("%d/%m/%Y")
    end
  end
end
