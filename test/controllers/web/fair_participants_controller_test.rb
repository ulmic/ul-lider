require 'test_helper'

class Web::FairParticipantsControllerTest < ActionController::TestCase
  test "new" do
    get :new
    assert_response :success
  end
end
