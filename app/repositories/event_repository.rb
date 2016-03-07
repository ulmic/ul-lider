module EventRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :contest_year, -> (year) { where contest_year: year  }
  end
end
