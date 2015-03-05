class Web::EventsController < Web::ApplicationController
  def index
    @events = Event.all.decorate
  end

  def show
    @event = Event.find(params[:id]).decorate
  end
end
