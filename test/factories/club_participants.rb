FactoryGirl.define do
  factory :club_participant, class: 'Club::Participant' do
    first_name { generate :human_name }
    last_name { generate :human_name }
    patronymic { generate :human_name }
    phone { generate :phone }
    email
    birth_date { DateTime.now }
  end
end
