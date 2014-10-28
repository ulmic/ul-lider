class Web::Admin::MailersController < Web::Admin::ApplicationController
  def index
  end

  def broadcast
    user = User.find_by(email: params[:broadcast][:email])
    BroadcastWorker.perform_async([user.id], params[:broadcast][:message])
    redirect_to admin_mailers_path
  end

  def broadcast_all
    ids = User.pluck :id
    BroadcastWorker.perform_async(ids, params[:broadcast][:message])
    redirect_to admin_mailers_path
  end
end
