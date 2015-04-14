class Event::Participant < ActiveRecord::Base
  belongs_to :report, foreign_key: :event_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :event_id, presence: true
end
