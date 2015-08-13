require 'test_helper'

class Web::Admin::Club::ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = create :club_participant
    @admin = create :admin
    sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant" do
    attributes = attributes_for :club_participant

    post :create, club_participant: attributes
    assert_response :redirect

    participant = Club::Participant.last
    assert_equal attributes[:first_name], participant.first_name
  end

  test "should not create participant" do
    attributes = { first_name: @participant.first_name }

    post :create, club_participant: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @participant
    assert_response :success
  end

  test "should update participant by admin" do
    attributes = attributes_for :club_participant
    put :update, id: @participant, club_participant: attributes
    assert_response :redirect

    @participant.reload
    assert_equal attributes[:first_name], @participant.first_name
  end

  test "should not update participant with render edit" do
    attributes = attributes_for :club_participant
    attributes[:first_name] = nil
    put :update, id: @participant, club_participant: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy participant" do
    assert_difference('Club::Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to admin_club_participants_path
  end
end
