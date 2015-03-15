class Web::EventsController < Web::ApplicationController
  def index
    users = User.on_third_stage
    @events = []
    users.each do |user|
      if user.event.present?
        @events << user.event.decorate
      end
    end
  end

  def show
    @event = Event.find(params[:id]).decorate
    @social_participants = @event.event_social_participants.shuffle.first 10
    @social_participants_count = @event.event_social_participants.count
  end
end
