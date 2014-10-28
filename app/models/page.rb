class Page < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :slug, presence: true,
                   uniqueness: true
end
