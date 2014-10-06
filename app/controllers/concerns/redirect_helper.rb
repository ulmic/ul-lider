module Concerns
  module RedirectHelper
    def try_redirect_to_from_or(default)
      redirect_to params[:from] || default
    end

    def try_redirect_to_back_or(path = root_path)
      redirect_to (request.referer || path )
    end
  end
end
