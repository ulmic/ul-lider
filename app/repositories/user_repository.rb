module UserRepository
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :participants, -> { where role: :participant }
    scope :admins, -> { where role: :admin }
    scope :fair_participants, -> { where role: :fair_participant }
    scope :active, -> { where state: :active }
    scope :confirmed, -> { where state: :confirmed_by_admin }
    scope :waiting_confirmation, -> { where state: :waiting_confirmation }
    scope :reserve_schoolers, -> { where role: :reserve_school }
    scope :on_third_stage, -> { where state: :on_third_stage }
  end
end

