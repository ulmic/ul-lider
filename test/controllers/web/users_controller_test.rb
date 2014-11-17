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
    attrs = attributes_for :user
    post :create, user: attrs
    assert_response :redirect
    user = User.find_by(attrs.extract(:email))
    assert { user }
  end

  test "confirm" do
    get :confirm, id: @user.id, confirmation_token: @user.confirmation_token
    assert_response :redirect

    @user.reload
    assert { @user.active? }
  end

  test 'should not create' do
    attrs = attributes_for :user
    attrs[:first_name] = nil
    count = User.count
    post :create, user: attrs
    assert_response :success
    user = User.find_by(attrs.extract(:email))
    assert_equal count, User.count
  end
end
