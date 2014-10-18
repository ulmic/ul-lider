class Web::Admin::NewsController < Web::Admin::ApplicationController
  def index
    @news = NewsDecorator.decorate_collection NewsEditType.all
  end

  def new
    @news = NewsEditType.new
  end

  def edit
    @news = NewsEditType.find params[:id]
  end

  def create
    @news = NewsEditType.new params[:news]
    if @news.save
      redirect_to admin_news_index_path
    else
      render action: :new
    end
  end

  def update
    @news = NewsEditType.find params[:id]
    if @news.update_attributes params[:news]
      redirect_to admin_news_index_path
    else
      render action: :edit
    end
  end

  def destroy
    @news = NewsEditType.find params[:id]
    @news.destroy
    redirect_to admin_news_index_path
  end
end
