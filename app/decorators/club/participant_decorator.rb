class Club::ParticipantDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{first_name} #{patronymic} #{last_name}"
  end

end
