class ApplicationController < ActionController::Base
  include Concerns::AuthManagment
  include Concerns::StagesHelper

  helper_method :signed_in?, :current_user
end
