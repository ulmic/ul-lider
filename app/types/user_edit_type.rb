class UserEditType < User
  include ApplicationType

  validates :email, presence: true
  validates :password, presence: true
#   validates :accept_agreement, acceptance: true

  permit :email, :password, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
