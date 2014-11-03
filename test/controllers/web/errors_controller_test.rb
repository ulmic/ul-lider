require 'test_helper'

class Web::ErrorsControllerTest < ActionController::TestCase
  test "should not found" do
    get :not_found
    assert_response 404
    get :not_found, anchor: 'view_1'
    assert_response 404
    get :not_found, anchor: 'view_2'
    assert_response 404
    get :not_found, anchor: 'view_3'
    assert_response 404
  end
  test "should forbidden" do
    get :forbidden
    assert_response 403
  end
end
