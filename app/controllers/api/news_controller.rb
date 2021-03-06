class Api::NewsController < Api::ApplicationController
  def last_news
    @news = News.published.order('published_at')
    news_ids = []
    @news.each do |news|
      news_ids << news.id
    end
    render json: news_ids
  end

  def last_news_id
    if News.any?
      @news_id = News.published.last.id
      render json: @news_id
    else
      render json: 0
    end
  end
end
