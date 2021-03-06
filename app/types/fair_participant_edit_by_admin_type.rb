class FairParticipantEditByAdminType < User
  include ApplicationType

  attr_accessor :i_am_not_from_73reg

  validates :email, presence: true
  validates :birth_date, presence: true
  validates :municipality, presence: true
  validates :school, presence: true
  validates :group, presence: true
  validates :locality, presence: true
  validates :accept_agreement, acceptance: true
  validates :life_goals, presence: true
  validates :fair_goals, presence: true
  validates :region, presence: true

  permit :email, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode, :state, :accept_agreement, :life_goals, :fair_goals, :region, :i_am_not_from_73reg, :avatar_cache, :state_event, :role, :reserve_order_number

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
