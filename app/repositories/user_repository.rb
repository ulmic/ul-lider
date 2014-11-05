module UserRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :participants, -> { where role: :participant }
    scope :admins, -> { where role: :admin }
    scope :active, -> { where state: :active }
    scope :confirmed, -> { where state: :confirmed_by_admin }
    scope :waiting_confirmation, -> { where state: :waiting_confirmation }
  end
end

