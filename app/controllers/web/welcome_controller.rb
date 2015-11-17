class Web::WelcomeController < Web::ApplicationController
  def index
    @last_news = Ulmic::News.get_last_news
    @participants = UserDecorator.decorate_collection User.participants.where(state: :on_final_stage).shuffle
  end
end
