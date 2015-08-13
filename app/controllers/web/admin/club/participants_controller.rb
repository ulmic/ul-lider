class Web::Admin::Club::ParticipantsController < Web::Admin::Club::ApplicationController
  def index
    @participants = Club::ParticipantDecorator.decorate_collection Club::Participant.all
  end

  def new
    @participant = Club::Participant.new
  end

  def edit
    @participant = Club::Participant.find params[:id]
  end

  def create
    params[:club_participant].permit!
    @participant = Club::Participant.new params[:club_participant]
    if @participant.save
      redirect_to admin_club_participants_path
    else
      render action: :new
    end
  end

  def update
    params[:club_participant].permit!
    @participant = Club::Participant.find params[:id]
    if @participant.update_attributes params[:club_participant]
      redirect_to admin_club_participants_path
    else
      render action: :edit
    end
  end

  def destroy
    @participant = Club::Participant.find params[:id]
    @participant.destroy
    redirect_to admin_club_participants_path
  end
end
