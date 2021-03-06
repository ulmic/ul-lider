FactoryGirl.define do
  factory :fair_part, class: 'User' do
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
    avatar { generate :file }
  end
end
