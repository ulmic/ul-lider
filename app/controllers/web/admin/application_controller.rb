class Web::Admin::ApplicationController < Web::ApplicationController
  before_action :authenticate_admin!
  before_action :check_requests

  def check_requests
    @contest_parts = User.participants.where state: :active
    @fair_parts_count = User.fair_participants.count + User.reserve_schoolers.count
    @participants_on_fair_count = User.count - User.admins.count
  end

  layout 'admin'
end
