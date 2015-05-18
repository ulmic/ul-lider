class Web::Account::EventsController < Web::Account::ApplicationController
  def new
    @event = EventEditByUserType.new
  end

  def edit
    @event = EventEditByUserType.find params[:id]
  end

  def create
    @event = EventEditByUserType.new params[:event]
    if @event.save
      redirect_to account_root_path
    else
      render action: :new
    end
  end

  def update
    @event = EventEditByUserType.find params[:id]
    params[:event].permit!
    if @event.update_attributes params[:event]
      redirect_to account_root_path
    else
      render action: :edit
    end
  end
end
