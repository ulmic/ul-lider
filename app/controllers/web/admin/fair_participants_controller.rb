class Web::Admin::FairParticipantsController < Web::Admin::ApplicationController
  def index
    @confirmed_by_admin_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :confirmed_by_admin).reverse
    @waiting_confirmation_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :waiting_confirmation).reverse
    @active_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :active).reverse
    @inactive_requests = UserDecorator.decorate_collection User.fair_participants.where(state: :inactive).reverse
    @reserve_schoolers_requests = UserDecorator.decorate_collection User.reserve_schoolers.reverse
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
