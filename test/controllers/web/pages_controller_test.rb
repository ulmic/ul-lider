require 'test_helper'

class Web::PagesControllerTest < ActionController::TestCase
  setup do
    @page = create :page
  end

  test "should get show" do
    get :show, slug: @page.slug
    assert_response :success, @response.body
  end
end
