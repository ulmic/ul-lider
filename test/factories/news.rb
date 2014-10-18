# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title { generate :string }
    body { generate :string }
    published_at { generate :date }
    photo { generate :file }
  end
end
