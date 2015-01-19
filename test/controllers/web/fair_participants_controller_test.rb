require 'test_helper'

class Web::FairParticipantsControllerTest < ActionController::TestCase
  test "new" do
    get :new
    assert_response :success
  end

#  test "create" do
#    attrs = attributes_for :fair_part
#    post :create, user: attrs
#    assert_response :redirect
#    fair_part = User.find_by(attrs.extract(:email))
#    assert { fair_part }
#  end
end
