class Web::WelcomeController < Web::ApplicationController
  def index
    @participants = UserDecorator.decorate_collection User.participants.where(state: :on_third_stage).shuffle
  end
end
