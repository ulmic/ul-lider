class FairParticipantRegistrationType < User
  include ApplicationType

  attr_accessor :i_am_not_from_73reg, :i_am_reserve_school

  validates :email, presence: true
  validates :birth_date, presence: true
  validates :municipality, presence: true
  validates :school, presence: true
  validates :group, presence: true
  validates :locality, presence: true
  validates :postcode, presence: true
  validates :accept_agreement, acceptance: true
  validates :life_goals, presence: true
  validates :fair_goals, presence: true
  validates :region, presence: true

  permit :email, :avatar, :first_name, :last_name, :birth_date, :municipality, :patronymic, :school, :group, :mobile_phone, :locality, :postcode, :state, :accept_agreement, :life_goals, :fair_goals, :region, :i_am_not_from_73reg, :avatar_cache, :role, :i_am_reserve_school

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end

  def i_am_reserve_school=(i_am_reserve_school)
    if i_am_reserve_school == '1'
      write_attribute :role, :reserve_school
    else
      write_attribute :role, :fair_participant
    end
  end
end
