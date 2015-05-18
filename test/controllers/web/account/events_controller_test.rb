require 'test_helper'

class Web::Account::EventsControllerTest < ActionController::TestCase
  setup do
    @event = create :event
    user = create :user
    sign_in user
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

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
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
end
