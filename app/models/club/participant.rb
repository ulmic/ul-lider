class Club::Participant < ActiveRecord::Base
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    email: true
  validates :first_name, presence: true, human_name: true
  validates :last_name, presence: true, human_name: true
  validates :patronymic, presence: true, human_name: true
  validates :phone, phone: true
  validates :birth_date, presence: true

  extend Enumerize
  enumerize :past_participation, in: [ :part, :not_part ]
end
