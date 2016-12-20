FactoryGirl.define do
  factory :user do
    first_name { generate :human_name }
    last_name { generate :human_name }
    patronymic { generate :human_name }
    school { generate :string }
    group { generate :string }
    locality { generate :string }
    postcode { generate :postcode }
    mobile_phone { generate :phone }
    birth_date { generate :date }
    email
    password { generate :string }
    avatar { generate :file }
    creative_work { generate :file }
    state 'waiting_confirmation'
  end
end
