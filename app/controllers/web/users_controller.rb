class Web::UsersController < Web::ApplicationController
  def index
    @users = User.where state: :confirmed_by_admin
  end

  def new
    if filling_is_during?
      @user = UserRegistrationType.new
    else
      redirect_to "/pages/#{:end_of_filling}", status: :moved_permanently
    end
  end

  def create
    @user = UserRegistrationType.new params[:user]
    @user.generate_confirmation_token
    if @user.save
      UserMailer.delay.confirmation_instructions(@user)
      sign_in @user
      f(:success)
      redirect_to root_path
    else
      f(:error, now: true)
      render :new
    end
  end

  def confirm
    user = User.find_by!(params.extract(:id, :confirmation_token).to_hash)
    if user.confirm
      sign_in user
      f(:success)
    else
      f(:error)
    end
    redirect_to root_path
  end

  def update_status
    @user = User.find_by_email params[:user][:email]
    if @user
      if @user.first_name == params[:user][:first_name] and @user.last_name == params[:user][:last_name]
        if params[:approve]
          @user.approve_second_stage
        elsif params[:decline]
          @user.fair_participant_decline
          reserve_user = User.where(state: :active).where.not(role: :admin).order('reserve_order_number asc').first
          reserve_user.admin_confirm
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
