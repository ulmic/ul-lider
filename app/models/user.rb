# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  mount_uploader :creative_work, CreativeWorkUploader

  has_secure_password validations: false

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :patronymic, presence: true
  validates :birth_date, presence: true,
                         timeliness: { on_or_after: lambda { Date.parse('31 May 1993') } }
  validates :municipality, presence: true
  validates :school, presence: true
  validates :group, presence: true
  validates :mobile_phone, presence: true,
                           phone: true
  validates :home_phone, phone: true,
                         allow_blank: true
  validates :locality, presence: true
  validates :creative_work, file_size: { maximum: 25.megabytes.to_i }
  validates :creative_work_url, url: true,
                                allow_blank: true
  validates :avatar, presence: true,
                     file_size: { maximum: 3.megabytes.to_i }

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

  extend Enumerize
  include Municipalities
  enumerize :municipality, in: Municipalities.list, default: Municipalities.list.first

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
