class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @users = UserDecorator.decorate_collection User.participants
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
      UserMailer.delay.activation_info @user if @user.admin_confirmed?
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
end
