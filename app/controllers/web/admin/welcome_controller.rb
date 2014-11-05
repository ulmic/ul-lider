class Web::Admin::WelcomeController < Web::Admin::ApplicationController
  def index
    @confirmed_by_admin_users_count = User.participants.confirmed.count
    @new_users_count = User.participants.waiting_confirmation.count
    @waiting_approve_count = User.participants.active.count
  end
end
