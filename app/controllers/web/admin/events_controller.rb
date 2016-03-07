class Web::Admin::EventsController < Web::Admin::ApplicationController
  def index
    @events = EventDecorator.decorate_collection Event.contest_year configus.current_contest_year
  end

  def new
    @event = EventEditByAdminType.new
  end

  def edit
    @event = EventEditByAdminType.find params[:id]
  end

  def create
    @event = EventEditByAdminType.new params[:event]
    if @event.save
      redirect_to admin_events_path
    else
      render action: :new
    end
  end

  def update
    @event = EventEditByAdminType.find params[:id]
    params[:event].permit!
    if @event.update_attributes params[:event]
      redirect_to admin_events_path
    else
      render action: :edit
    end
  end

  def destroy
    @event = EventEditByAdminType.find params[:id]
    @event.destroy
    redirect_to admin_events_path
  end
end
