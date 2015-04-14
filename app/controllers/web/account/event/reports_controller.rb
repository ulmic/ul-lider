class Web::Account::Event::ReportsController < Web::Account::Event::ApplicationController
  def new
    @report = ::Event.find_by_user_id(current_user).becomes! Event::Report
  end

  def create
    params[:event_report].permit!
    event = ::Event.find_by_user_id params[:event_report][:user_id]
    ::Event.find(event.id).update type: 'Event::Report'
    @report = ::Event::Report.find event.id
    if @report.update_attributes params[:event_report]
      redirect_to account_event_report_path @report
    else
      render action: :new
    end
  end

  def show
    @report = EventDecorator.decorate ::Event::Report.find params[:id]
  end
end
