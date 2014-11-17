require 'test_helper'

class Api::NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
  end
  test "should get last news" do
    get :last_news, format: :json
    assert_response :success, @response.body
  end

  test "should get last news id" do
    get :last_news_id, format: :json
    assert_response :success, @response.body
  end

  test 'should get last news id without news' do
    @news.destroy
    get :last_news_id, format: :json
    assert_response :success, @response.body
  end
end
