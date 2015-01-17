class FairParticipantRegistrationType < User
  include ApplicationType

  validates :email, presence: true
  validates :password, presence: true
  validates :birth_date, presence: true
  validates :municipality, presence: true
  validates :school, presence: true
  validates :group, presence: true
  validates :locality, presence: true
  validates :postcode, presence: true
  validates :accept_agreement, acceptance: true

  permit :email, :password, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode, :state, :accept_agreement

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
