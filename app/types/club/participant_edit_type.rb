class Club::ParticipantEditType < Club::Participant
  include ApplicationType

  permit :email, :first_name, :last_name, :patronymic, :phone, :birth_date

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
