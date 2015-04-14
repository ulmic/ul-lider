FactoryGirl.define do
  factory :event_participant, :class => 'Event::Participant' do
    event_id 1
first_name "MyText"
last_name "MyText"
phone "MyText"
  end

end
