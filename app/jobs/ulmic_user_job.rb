class UlmicUserJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    UlmicApi::Wrapper.call endpoint: '/activity_lines/lider/ya_lider/participants', 
      params: { user: user.attributes, token: ENV['PARTICIPANT_CREATE_TOKEN'] },
      method: :post
  end
end
