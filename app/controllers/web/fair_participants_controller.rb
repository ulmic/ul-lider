class Web::FairParticipantsController < Web::ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.where(state: :confirmed_by_admin).where.not(role: :admin)
  end
  def new
    if filling_on_fair_idea_is_during?
      @fair_part = FairParticipantRegistrationType.new
    else
      redirect_to "/pages/#{:end_of_filling_to_fair_idea}", status: :moved_permanently
    end
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
