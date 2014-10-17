class News < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :published_at, presence: true
end
