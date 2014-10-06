require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @attrs = attributes_for :user
    @user = create :user
    @user.generate_confirmation_token
    @user.save
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "index" do
    get :index
    assert_response :success
  end

  test "create" do
    @attrs = @attrs.merge({password_confirmation: @attrs[:password]})
    post :create, user: @attrs

    assert_response :redirect
    user = User.find_by(@attrs.extract(:email))
    assert { user }
  end

  test "confirm" do
    get :confirm, id: @user.id, confirmation_token: @user.confirmation_token
    assert_response :redirect

    @user.reload
    assert { @user.active? }
  end
end
