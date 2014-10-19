class Web::WelcomeController < Web::ApplicationController
  def index
    @last_news = NewsDecorator.decorate_collection News.published.last 3
  end
end
