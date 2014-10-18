class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = UserEditType.new
  end

  def edit
    @user = UserEditType.find params[:id]
  end

  def create
    @user = UserEditType.new params[:user]
    if @user.save
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  def update
    @user = UserEditType.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to admin_users_path
    else
      render action: :edit
    end
  end

  def destroy
    @user = UserEditType.find params[:id]
    @user.destroy
    redirect_to admin_users_path
  end
end
