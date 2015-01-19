class UserEditByAdminType < User
  include ApplicationType

  validates :email, presence: true

  permit :email, :password, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode, :creative_work, :url_creative_work, :role, :state, :state_event, :avatar_cache

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
