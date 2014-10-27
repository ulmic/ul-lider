class Web::ApplicationController < ApplicationController
  include Concerns::FlashHelper
  include Concerns::TitleHelper
  include Concerns::RedirectHelper

  helper_method :title

  #before_action :required_basic_auth! if Rails.env.staging?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    title("Ul-lider")
  end

  if Rails.env.production?
    rescue_from ActionController::RoutingError, ActionView::MissingTemplate, ActiveRecord::RecordNotFound, NoMethodError do |exception|
      Rails.logger.warn "ERROR MESSAGE: #{exception.message}"
      redirect_to not_found_errors_path
    end
  end
end
