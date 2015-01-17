require 'test_helper'

class Web::FairParticipantsControllerTest < ActionController::TestCase
  setup do
    @attrs = attributes_for :fair_part
    @fair_part = create :fair_part
    @fair_part.generate_confirmation_token
    @fair_part.save
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    attrs = attributes_for :fair_part
    post :create, fair_part: attrs
    assert_response :redirect
    fair_part = User.find_by(attrs.extract(:email))
    assert { fair_part }
  end
end
