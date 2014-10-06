class UserPasswordType < User
  include ApplicationType

  permit :password

  validates :password, presence: true
end
