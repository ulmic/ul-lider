require 'test_helper'

class Web::EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
  end
  test 'should get show' do
    get :show, id: @event
    assert_response :success, @response.body
  end
  test 'should get index' do
    get :index
    assert_response :success, @response.body
  end
end
