module UserRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :participants, -> { where role: :participant }
  end
end

