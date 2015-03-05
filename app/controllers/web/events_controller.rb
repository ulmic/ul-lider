class Web::EventsController < Web::ApplicationController
  def index
    @events = Event.all.decorate
  end

  def show
    @event = Event.find(params[:id]).decorate
    @social_participants = @event.event_social_participants.shuffle.first 10
  end
end
