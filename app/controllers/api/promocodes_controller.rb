class Api::PromocodesController < Api::ApplicationController
  def update
    @promocode = Promocode.find_by_code params[:promocode][:code]
    if @promocode && (@promocode.email.nil? || @promocode.email == params[:promocode][:email])
      if @promocode.update_attributes email: params[:promocode][:email]
        head :ok
      else
        head :bad_request
      end
    else
      head :not_found
    end
  end
end
