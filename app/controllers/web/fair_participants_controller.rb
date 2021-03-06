class Web::FairParticipantsController < Web::ApplicationController
  def index
    @second_stage_users = UserDecorator.decorate_collection User.contest_year(2016).where("state = 'on_second_stage' OR state = 'second_stage_approved'").where.not(role: :admin)
    @users = UserDecorator.decorate_collection User.contest_year(2016).where("state = 'waiting_confirmation' OR state = 'fair_participant_approved' OR state = 'confirmed_by_admin'").where.not(role: :admin)
    @reserve_users = UserDecorator.decorate_collection User.contest_year(2016).where(state: :active).where.not(role: :admin).order('reserve_order_number asc')
    @declined_users = UserDecorator.decorate_collection User.fair_participants.contest_year(2016).where(state: :inactive).where.not(role: :admin)
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
  def update_status
    @user = User.where(email: params[:user][:email], contest_year: 2016).first
    if @user
      if @user.first_name == params[:user][:first_name] and @user.last_name == params[:user][:last_name]
        if params[:approve]
          unless @user.update_attributes state: :fair_participant_approved
            redirect_to fair_participants_path
            f :error
          end
        elsif params[:decline]
          if @user.update_attributes state: :fair_participant_declined
            reserve_user = User.where(state: :active).where.not(role: :admin).order('reserve_order_number asc').first
            reserve_user.admin_confirm
          else
            redirect_to fair_participants_path
            f :error
          end
        end
        redirect_to fair_participants_path
      else
        redirect_to fair_participants_path
        f :error
      end
    else
      redirect_to fair_participants_path
      f :error
    end
  end
end
