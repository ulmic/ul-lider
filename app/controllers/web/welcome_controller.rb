class Web::WelcomeController < Web::ApplicationController
  def index
    @last_news = NewsDecorator.decorate_collection News.published.last 3
    @participants = UserDecorator.decorate_collection User.participants.shuffle.first 13
  end
end
