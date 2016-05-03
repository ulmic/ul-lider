class Web::Admin::ApplicationController < Web::ApplicationController
  before_action :authenticate_admin!
  before_action :check_requests

  def check_requests
    @contest_parts = User.participants.contest_year(configus.current_contest_year)
    @fair_parts_count = User.fair_participants.count + User.reserve_schoolers.count
    @participants_on_fair_count = User.count - User.admins.count
    @reports_count = ::Event::Report.contest_year(configus.current_contest_year).count
    @club_participants_count = ::Club::Participant.count
  end

  layout 'admin'
end
