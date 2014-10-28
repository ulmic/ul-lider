require 'test_helper'

class Web::Admin::AdminsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @admin = create :admin
    sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
