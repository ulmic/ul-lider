class Web::FairParticipantsController < Web::ApplicationController
  def new
    @fair_part = FairParticipantRegistrationType.new
  end

  def create
    @fair_part = FairParticipantRegistrationType.new params[:user]
    @fair_part.generate_confirmation_token
    if @fair_part.save
      UserMailer.delay.confirmation_instructions @fair_part
      sign_in @fair_part
      f :success
      redirect_to root_path
    else
      f :error, now: true
      render :new
    end
  end
end
