class Web::SessionsController < Web::ApplicationController
  # FIXME forbid access if the user is signed in
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      user = @session.user
      sign_in user
      f(:success)
      if user.role.admin?
        try_redirect_to_from_or admin_root_path
      elsif user.on_third_stage?
        try_redirect_to_from_or account_root_path
      else
        try_redirect_to_from_or root_path
      end
    else
      render :new
    end
  end

  def destroy
    sign_out
    f(:success)
    try_redirect_to_from_or root_path
  end
end
