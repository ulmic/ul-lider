class Web::NewsController < Web::ApplicationController
  def index
    @news = NewsDecorator.decorate_collection News.published.reverse
  end

  def show
    @news = News.find params[:id]
    if !@news.is_published?
      redirect_to not_found_errors_path
    end
  end
end
