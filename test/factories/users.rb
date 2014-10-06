# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name { generate :string }
    last_name { generate :string }
    birth_date { generate :date }
    email
    password { generate :string }
  end
end
