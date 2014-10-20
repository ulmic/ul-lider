class UserRegistrationType < User
  include ApplicationType

  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :patronymic, presence: true
  validates :birth_date, presence: true,
                         timeliness: { on_or_after: lambda { Date.parse('31 May 1993') } }
  validates :municipality, presence: true
  validates :school, presence: true
  validates :group, presence: true
  validates :mobile_phone, presence: true,
                           phone: true
  validates :home_phone, phone: true,
                         timeliness: { on_or_after: lambda { Date.parse('31 May 1993') } }
  validates :locality, presence: true
  validates :creative_work, file_size: { maximum: 25.megabytes.to_i }
  validates :url_creative_work, url: true,
                                allow_blank: true
#   validates :accept_agreement, acceptance: true

  permit :email, :password, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode, :creative_work, :url_creative_work

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
