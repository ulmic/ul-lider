require "test_helper"

class Web::RemindPasswordsControllerTest < ActionController::TestCase
  test "#new" do
    get :new
    assert_response :success
  end

  test "#create valid data for password remind" do
    user = create :user

    post :create, user_password_remind_type: {email: user.email}
    assert_response :redirect
  end

  test "#create invalid data for password remind" do
    create :user

    post :create, user_password_remind_type: {email: ""}
    assert_response :success
  end

end
