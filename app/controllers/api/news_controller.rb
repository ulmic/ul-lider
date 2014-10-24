class Api::NewsController < Api::ApplicationController
  def last_news
    @news = News.published.order('published_at')
    news_ids = []
    @news.each do |news|
      news_ids << news.id
    end
    render json: news_ids
  end
end
