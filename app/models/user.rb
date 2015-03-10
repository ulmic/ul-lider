# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  mount_uploader :creative_work, CreativeWorkUploader

  has_secure_password validations: false

  has_one :event

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    email: true
  validates :first_name, presence: true, human_name: true
  validates :last_name, presence: true, human_name: true
  validates :patronymic, presence: true, human_name: true
  validates :mobile_phone, phone: true
  validates :avatar, file_size: { maximum: 3.megabytes.to_i }
  validates :creative_work, file_size: { maximum: 25.megabytes.to_i }
  validates :role, presence: true

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active
    state :confirmed_by_admin
    state :on_second_stage
    state :fair_participant_approved
    state :fair_participant_declined
    state :second_stage_approved
    state :on_third_stage

    event :confirm do
      transition all => :active
    end

    event :admin_confirm do
      transition all => :confirmed_by_admin
    end

    event :deactivate do
      transition all => :inactive
    end

    event :push_to_second_stage do
      transition all => :on_second_stage
    end

    event :push_to_third_stage do
      transition all => :on_third_stage
    end

    event :fair_participant_approve do
      transition all => :fair_participant_approved
    end

    event :fair_participant_decline do
      transition all => :fair_participant_declined
    end

    event :approve_second_stage do
      transition all => :second_stage_approved
    end
  end

  extend Enumerize
  include Municipalities
  enumerize :municipality, in: Municipalities.list, default: Municipalities.list.first
  enumerize :role, in: [ :participant, :admin, :fair_participant, :reserve_school ], default: :participant
  include RussiaRegions
  enumerize :region, in: RussiaRegions.name_list

  include UserRepository

  def guest?
    false
  end

  def generate_confirmation_token
    self.confirmation_token = SecureHelper.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureHelper.generate_token
  end

  def can_reset_password?
    !self.inactive?
  end

  def to_s
    "#{id} | #{first_name} #{last_name} | #{email}"
  end
end
