class Web::Admin::AdminsController < Web::Admin::ApplicationController

  def index
    @users = UserDecorator.decorate_collection User.admins
  end
end
