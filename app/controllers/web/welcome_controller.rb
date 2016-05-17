class Web::WelcomeController < Web::ApplicationController
  def index
    @participants = UserDecorator.decorate_collection User.participants.where(state: :on_final_stage, contest_year: configus.current_contest_year).shuffle
  end
end
