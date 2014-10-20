class Web::Admin::PagesController < Web::Admin::ApplicationController
  def index
    @pages = PageDecorator.decorate_collection Page.all
  end

  def new
    @page = PageEditType.new
  end

  def edit
    @page = PageEditType.find params[:id]
  end

  def create
    @page = PageEditType.new params[:page]
    if @page.save
      redirect_to admin_pages_path
    else
      render action: :new
    end
  end

  def update
    @page = PageEditType.find params[:id]
    if @page.update_attributes params[:page]
      redirect_to admin_pages_path
    else
      render action: :edit
    end
  end

  def destroy
    @page = PageEditType.find params[:id]
    @page.destroy
    redirect_to admin_pages_path
  end
end
