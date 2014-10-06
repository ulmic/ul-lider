# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_secure_password validations: false

  validates :email, presence: true, uniqueness: {case_sensitive: false}, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active

    event :activate do
      transition all => :active
    end

    event :confirm do
      transition [:waiting_confirmation, :inactive, :active] => :active
    end

    event :deactivate do
      transition [:waiting_confirmation, :active] => :inactive
    end
  end

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
    "#{id} | #{nickname} | #{first_name} #{last_name} | #{email}"
  end
end
