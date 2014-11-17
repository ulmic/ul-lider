require 'test_helper'

class Api::NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
  end
  test "should get last news" do
    @news.published_at = DateTime.now
    @news.save
    get :last_news, format: :json
    assert_response :success, @response.body
  end

  test "should get last news id" do
    @news.published_at = DateTime.now - 1.day
    @news.save
    get :last_news_id, format: :json
    assert_response :success, @response.body
  end

  test 'should get last news id without news' do
    @news.destroy
    get :last_news_id, format: :json
    assert_response :success, @response.body
  end
end
