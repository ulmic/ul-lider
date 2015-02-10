require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
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

  test "should create user" do
    attributes = attributes_for :user

    post :create, user: attributes
    assert_response :redirect

    user = User.last
    assert_equal attributes[:first_name], user.first_name
  end

  test "should not create user" do
    attributes = { first_name: @user.first_name }

    post :create, user: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user by admin" do
    attributes = attributes_for :user
    put :update, id: @user, user: attributes
    assert_response :redirect

    @user.reload
    assert_equal attributes[:first_name], @user.first_name
  end

  test "should not update user with render edit" do
    attributes = attributes_for :user
    attributes[:first_name] = nil
    put :update, id: @user, user: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to admin_users_path
  end

  test "should push to second_stage" do
    put :push_to_second_stage, id: @user
    @user.reload
    assert @user.on_second_stage?
    assert_redirected_to admin_users_path
  end
end
