class EventSocialParticipant < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true
  validates :event_id, presence: true
end
