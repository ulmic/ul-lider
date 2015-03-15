require 'test_helper'

class Web::Admin::EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
    @admin = create :admin
    sign_in @admin
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    attributes = attributes_for :event

    post :create, event: attributes
    assert_response :redirect

    event = Event.last
    assert_equal attributes[:title], event.title
  end

  test "should not create event" do
    attributes = { title: @event.title }

    post :create, event: attributes
    assert_response :success
  end

  test "should get edit by admin" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event by admin" do
    attributes = attributes_for :event
    put :update, id: @event, event: attributes
    assert_response :redirect

    @event.reload
    assert_equal attributes[:title], @event.title
  end

  test "should not update event with render edit" do
    attributes = attributes_for :event
    attributes[:title] = nil
    put :update, id: @event, event: attributes

    assert_response :success

    assert_template :edit
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to admin_events_path
  end
end
