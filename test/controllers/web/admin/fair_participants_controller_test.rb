require 'test_helper'

class Web::Admin::FairParticipantsControllerTest < ActionController::TestCase
  setup do
    @fair_part = create :fair_part
    @admin = create :admin
    sign_in @admin
  end

  test "should get index" do
    get :index, state: :all
    assert_response :success
    get :index, state: :active
    assert_response :success
    get :index, state: :confirmed_by_admin
    assert_response :success
    get :index, state: :waiting_confirmation
    assert_response :success
    get :index, state: :inactive
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

#  test "should create fair_part" do
#    attributes = attributes_for :fair_part
#
#    post :create, user: attributes
#    assert_response :redirect
#
#    fair_part = User.last
#    assert_equal attributes[:first_name], User.first_name
#  end

  test "should not create fair_part" do
    attributes = { first_name: @fair_part.first_name }

    post :create, fair_part: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @fair_part
    assert_response :success
  end

#  test "should update fair_part by admin" do
#    attributes = attributes_for :fair_part
#    put :update, id: @fair_part, user: attributes
#    assert_response :redirect
#
#    @fair_part.reload
#    assert_equal attributes[:first_name], @fair_part.first_name
#  end

  test "should not update fair_part with render edit" do
    attributes = attributes_for :fair_part
    attributes[:first_name] = nil
    put :update, id: @fair_part, user: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy fair_part" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @fair_part
    end

    assert_redirected_to admin_fair_participants_path
  end
end
