class Web::Admin::Event::ReportsController < Web::Admin::Event::ApplicationController
  def index
    @reports = ::Event::Report.contest_year configus.current_contest_year
  end

  def show
    @report = ::Event::Report.find(params[:id]).decorate
  end
end
