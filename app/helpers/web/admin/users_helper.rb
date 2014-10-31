module Web::Admin::UsersHelper
  def user_states
    User.state_machines[:state].states
  end

  def user_states_events
    User.state_machines[:state].events
  end
end
