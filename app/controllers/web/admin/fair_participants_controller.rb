class Web::Admin::FairParticipantsController < Web::Admin::ApplicationController
  def index
    @confirmed_by_admin_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :confirmed_by_admin).reverse
    @active_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :active).order('reserve_order_number asc')
    @reserve_schoolers_requests = UserDecorator.decorate_collection User.reserve_schoolers.reverse
    @fair_participant_approved_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :fair_participant_approved)
    @fair_participant_declined_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :fair_declined_approved)
    @fair_wait_confirmation = UserDecorator.decorate_collection User.fair_participants.where(state: :wait_confirmation)
  end

  def new
    @fair_part = FairParticipantEditByAdminType.new
  end

  def edit
    @fair_part = FairParticipantEditByAdminType.find params[:id]
  end

  def create
    @fair_part = FairParticipantEditByAdminType.new params[:user]
    if @fair_part.save
      redirect_to admin_fair_participants_path
    else
      render action: :new
    end
  end

  def update
    @fair_part = FairParticipantEditByAdminType.find params[:id]
    if @fair_part.update_attributes params[:user]
      UserMailer.delay.fair_idea_confirmation @fair_part if @fair_part.confirmed_by_admin?
      redirect_to admin_fair_participants_path
    else
      render action: :edit
    end
  end

  def destroy
    @fair_part = FairParticipantEditByAdminType.find params[:id]
    @fair_part.destroy
    redirect_to admin_fair_participants_path
  end
end
