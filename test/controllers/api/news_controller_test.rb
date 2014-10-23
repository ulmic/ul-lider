require 'test_helper'

class Api::NewsControllerTest < ActionController::TestCase
  test "should get last news" do
    get :last_news, format: :json
    assert_response :success, @response.body
  end
end
