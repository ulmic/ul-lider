class UserForm < ApplicationForm
  properties :email, :password, :first_name, :patronymic, :last_name, :birth_date, :municipality, :locality,
    :school, :group, :home_phone, :mobile_phone, :avatar, :creative_work

  validates :email, presence: true,
                    email: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :patronymic, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :municipality, presence: true
  validates :locality, presence: true
  validates :school, presence: true
  validates :group, presence: true
  validates :home_phone, phone: true,
                         allow_blank: true
  validates :mobile_phone, phone: true
  validates :creative_work, presence: true
  validates :avatar, presence: true

  collection :fields, populate_if_empty: User::Field do
    properties :value, :user_id, :value_type, :title

    validates :value, presence: true
    validates :value_type, presence: true
    validates :title, presence: true
  end

  def build_values_for_request!
    titles = ::User::Field.title.values
    titles.each do |title|
      fields << model.fields.build(title: title)
    end
  end
end
