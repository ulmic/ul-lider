class Event::Report < Event
  mount_uploader :file, CreativeWorkUploader

  validates :results, presence: true
  validates :file, presence: true
end
