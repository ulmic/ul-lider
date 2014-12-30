module NewsRepository
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where "published_at <= ?", DateTime.now }
    scope :unpublished, -> { where "published_at > ?", DateTime.now }
  end
end
