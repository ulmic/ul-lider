module UserRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :participants, -> { where role: :participant }
    scope :admins, -> { where role: :admin }
  end
end

