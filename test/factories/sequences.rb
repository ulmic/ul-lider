FactoryGirl.define do

  sequence :facebook_auth_hash do
    {
      provider: 'facebook',
      uid: '1234567',
      info: {
        email: FactoryGirl.generate(:email),
        first_name: FactoryGirl.generate(:name),
        last_name: FactoryGirl.generate(:name)
      }
    }
  end

  sequence :sir_trevor_json do
    '{
       "data": [{
       "type": "text",
       "data": {
          "text": "Hello, my name is **Sir Trevor**"
        }
       }]
    }'
  end

  sequence :token do |n|
    SecureRandom.urlsafe_base64
  end

  sequence :order do |n|
    n
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :description do |n|
    "description#{n}"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  sequence :name, aliases: [:title] do |n|
    "name#{n}"
  end

  sequence :body do |n|
    "body#{n}"
  end

  sequence :integer do |n|
    n
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :phone do |n|
    "+7123456789"
  end

  sequence :url do |n|
    "http://site#{n}.ru"
  end

  sequence :postcode do |n|
    "434343"
  end

  sequence :ip, aliases: [:public_ip, :private_ip] do |n|
    Faker::Internet.ip_v4_address
  end

  sequence :duration do |n|
    n.day
  end

  sequence :date, aliases: [:start_date, :end_date] do |n|
    Date.today + n.day
  end
end
