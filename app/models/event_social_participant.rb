class EventSocialParticipant < ActiveRecord::Base

  belongs_to :event

  validates :provider, presence: true
  validates :uid, presence: true
  validates :event_id, presence: true
end
