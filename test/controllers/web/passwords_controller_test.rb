require "test_helper"

class Web::PasswordsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.generate_reset_password_token
    @user.save
  end

  test "#edit with correct reset password token" do
    get :edit, reset_password_token: @user.reset_password_token
    assert_response :success
  end

  test "#edit without reset password token" do
    get :edit
    assert_response :redirect
  end

  test "#edit with wrong reset password token" do
    assert_raise ActiveRecord::RecordNotFound do
      get :edit, reset_password_token: "wrong_token"
    end
  end

  test "#update correct data for password resetting" do
    post :update, reset_password_token: @user.reset_password_token, user: { password: "1" }
    assert_response :redirect

    user_updated = User.find_by!(email: @user.email)
    assert user_updated.password_digest != @user.password_digest
  end

  test "#update incorrect data for password resetting" do
    post :update, reset_password_token: @user.reset_password_token, user: {password: ""}
    assert_response :success

    user_updated = User.find_by!(email: @user.email)
    assert user_updated.password_digest == @user.password_digest
  end

  test "#update with wrong reset password token" do
    assert_raise ActiveRecord::RecordNotFound do
      post :update, reset_password_token: "wrong_token", user: {password: "1"}
    end
  end
end
