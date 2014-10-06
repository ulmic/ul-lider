class Web::RemindPasswordsController < Web::ApplicationController

  def new
    @form = UserPasswordRemindType.new
  end

  def create
    @form = UserPasswordRemindType.new params[:user_password_remind_type]
    if @form.valid?
      user = @form.user
      if user.can_reset_password?
        user.generate_reset_password_token
        user.save!

        UserMailer.delay.remind_password(user)

        f(:success)
        redirect_to root_path
      end
      # else f(:error)
    else
      f(:error)
      render :new
    end
  end

end
