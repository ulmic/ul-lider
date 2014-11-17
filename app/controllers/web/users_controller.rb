class Web::UsersController < Web::ApplicationController
  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @search = User.ransack(query)
    @users = @search.result(distinct: true).page(params[:page]).decorate
  end

  def new
    @user = UserRegistrationType.new
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
end
