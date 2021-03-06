class Web::EventsController < Web::ApplicationController
  def index
    @events = User.on_third_stage.map(&:current_event).compact
  end

  def show
    @event = Event.find(params[:id]).decorate
    @social_participants = @event.event_social_participants.shuffle.first 10
    @social_participants_count = @event.event_social_participants.count
  end
end
