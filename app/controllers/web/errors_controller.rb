class Web::ErrorsController < ApplicationController
  def not_found
    render status: 404
  end

  def forbidden
    render status: 403
  end
end
