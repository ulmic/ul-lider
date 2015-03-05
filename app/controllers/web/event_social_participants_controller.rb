class Web::EventSocialParticipantsController < Web::ApplicationController
  def create
    session[:event_id] = params[:event_id]
    redirect_to '/auth/vkontakte'
  end
  def callback
    omniauth_hash = request.env['omniauth.auth']
    provider = omniauth_hash['provider']
    uid = omniauth_hash['uid']
    first_name = omniauth_hash['info']['first_name']
    last_name = omniauth_hash['info']['last_name']
    photo = omniauth_hash['info']['image']
    profile = omniauth_hash['info']['urls']['Vkontakte']
    social_participants = EventSocialParticipant.where provider: provider, uid: uid, event_id: session[:event_id]
    if social_participants.any?
      f :error
      redirect_to event_path social_participants.first.event
    else
      event_social_participant = EventSocialParticipant.new provider: provider, uid: uid, first_name: first_name, last_name: last_name, event_id: session[:event_id], photo: photo, profile: profile
      if event_social_participant.save
        session[:events] ||= []
        session[:events] << session[:event_id]
        f :success
        redirect_to event_path event_social_participant.event
      else
        f :error
        redirect_to event_path event_social_participant.event
      end
    end
  end

  alias :vkontakte :callback
end
