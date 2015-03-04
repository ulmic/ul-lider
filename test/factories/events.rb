FactoryGirl.define do
  factory :event do
    association :user
    user_id { User.last ? User.last.id : 1  }
    title { generate :string }
    begin_date { generate :date }
    end_date { generate :date }
    place { generate :string }
    description { generate :string }
  end
end
