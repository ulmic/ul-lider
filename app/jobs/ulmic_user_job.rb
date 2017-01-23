class UlmicUserJob < ActiveJob::Base
  queue_as :default

  def perform(user_attributes)
    user_attributes['avatar'] = User.find(user_attributes['id']).avatar.url
    UlmicApi::Wrapper.call endpoint: '/activity_lines/lider/ya_lider/participants', 
      params: { token: ENV['PARTICIPANT_CREATE_TOKEN'] },
      body: user_attributes.to_json,
      method: :post
  end
end
