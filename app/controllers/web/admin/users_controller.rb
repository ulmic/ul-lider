class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @first_stage_users = UserDecorator.decorate_collection User.participants.contest_year(configus.current_contest_year).where.not(state: :on_second_stage).reverse
    @second_stage_users = UserDecorator.decorate_collection User.participants.contest_year(configus.current_contest_year).where("state = 'on_second_stage' OR state = 'second_stage_approved' OR state = 'fair_participant_declined'")
    @third_stage_users = UserDecorator.decorate_collection User.participants.contest_year(configus.current_contest_year).where state: :on_third_stage
    @final_stage_users = UserDecorator.decorate_collection User.participants.contest_year(configus.current_contest_year).where state: :on_final_stage
  end

  def new
    @user = UserEditByAdminType.new
  end

  def edit
    @user = UserEditByAdminType.find params[:id]
  end

  def create
    @user = UserEditByAdminType.new params[:user]
    if @user.save
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  def update
    @user = UserEditByAdminType.find params[:id]
    if @user.update_attributes params[:user]
      UserMailer.delay.activation_info @user if @user.confirmed_by_admin?
      redirect_to admin_users_path
    else
      render action: :edit
    end
  end

  def destroy
    @user = UserEditByAdminType.find params[:id]
    @user.destroy
    redirect_to admin_users_path
  end

  def push_to_second_stage
    @user = User.find params[:id]
    @user.push_to_second_stage
    redirect_to admin_users_path
  end

  def edit_average
    if User.update(params[:id], average: params[:user][:average])
      redirect_to admin_users_path
      f(:success)
    else
      redirect_to admin_users_path
      f(:error)
    end
  end
end
