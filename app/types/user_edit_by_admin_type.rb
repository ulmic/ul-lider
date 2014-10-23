class UserEditByAdminType < User
  include ApplicationType

  validates :email, presence: true
#   validates :accept_agreement, acceptance: true

  permit :email, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode, :creative_work, :url_creative_work, :role

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
