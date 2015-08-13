class Web::Club::ParticipantsController < Web::Club::ApplicationController
  def new
    @participant = ::Club::Participant.new
  end

  def create
    params[:club_participant].permit!
    @participant = ::Club::Participant.new params[:club_participant]
    if @participant.save
      f :success
      redirect_to root_path
    else
      f :error, now: true
      render :new
    end
  end
end
