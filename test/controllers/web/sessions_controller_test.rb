require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create(:user, state: :active)
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#create ok" do
    post :create, user_sign_in_type: {email: @user.email, password: @user.password}

    assert_response :redirect
    assert { signed_in? }
  end

  test "#create login user registrated via github" do
    user_git = create(:user, state: :active, password_digest: nil)

    post :create, user_sign_in_type: {email: user_git.email, password: "123"}

    assert_response :success
    assert { !signed_in? }
  end

  test "#create wrong password" do
    post :create, user_sign_in_type: {email: @user.email, password: "123"}

    assert_response :success
    assert { !signed_in? }
  end

  test "#destroy" do
    sign_in @user

    delete :destroy

    assert_response :redirect
    assert { !signed_in? }
  end

end
