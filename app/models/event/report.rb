class Event::Report < Event
  mount_uploader :file, CreativeWorkUploader

  has_many :participants, class_name: 'Event::Participant',
                          foreign_key: :event_id


  accepts_nested_attributes_for :participants
end
