class Api::NewsController < Api::ApplicationController
  def last_news
    @news = News.published.last
    if @news
      render json: @news.id
    else
      render json: 0
    end
  end
end
