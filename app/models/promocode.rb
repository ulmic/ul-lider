class Promocode < ActiveRecord::Base
  belongs_to :user

  validates :code, presence: true
end
