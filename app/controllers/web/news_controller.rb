class Web::NewsController < Web::ApplicationController
  def index
    @news = NewsDecorator.decorate_collection News.published.order('created_at DESC')
  end

  def show
    @news = News.find(params[:id]).decorate
    if !@news.is_published?
      redirect_to not_found_errors_path
    end
  end
end
