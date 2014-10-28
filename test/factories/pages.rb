# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title { generate :string }
    body { generate :string }
    slug { generate :string }
  end
end
