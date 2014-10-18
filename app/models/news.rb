class News < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true
  validates :photo, presence: true
end
