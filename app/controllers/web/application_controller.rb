class Web::ApplicationController < ApplicationController
  include Concerns::FlashHelper
  include Concerns::TitleHelper

  helper_method :title

  #before_action :required_basic_auth! if Rails.env.staging?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    title("Ul-lider")
  end
end
