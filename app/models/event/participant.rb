class Event::Participant < ActiveRecord::Base
  belongs_to :report, foreign_key: :event_id

  validates :event_id, presence: true
end
