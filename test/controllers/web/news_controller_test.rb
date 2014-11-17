require 'test_helper'

class Web::NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
  end

  test "should get index" do
    get :index
    assert_response :success, @response.body
  end

  test "should get show" do
    get :show, id: @news
    assert_response :success, @response.body
  end

  test "should not get show" do
    @news.published_at = DateTime.now + 1.day
    @news.save
    get :show, id: @news
    assert_response :redirect, @response.body
    assert_redirected_to not_found_errors_path
  end
end
