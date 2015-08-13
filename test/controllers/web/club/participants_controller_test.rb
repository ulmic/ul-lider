require 'test_helper'

class Web::Club::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = create :club_participant
  end

  test 'should get new' do
    get :new
    assert_response :success, @response.body
  end

  test 'should post create' do
    attributes = attributes_for :club_participant
    post :create, club_participant: attributes
    assert_response :redirect, @response.body
    participant = Club::Participant.last
    assert_equal participant.email, attributes[:email]
  end
end
