# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name { generate :string }
    last_name { generate :string }
    patronymic { generate :string }
    municipality { generate :string }
    school { generate :string }
    group { generate :string }
    locality { generate :string }
    postcode { generate :string }
    birth_date { generate :date }
    email
    password { generate :string }
  end
end
