class Web::Admin::Event::ReportsController < Web::Admin::Event::ApplicationController
  def index
    @reports = ::Event::Report.all.decorate
  end

  def show
    @report = ::Event::Report.find(params[:id]).decorate
  end
end
