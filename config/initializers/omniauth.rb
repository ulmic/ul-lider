OAUTH_KEYS = YAML.load_file(Rails.root.join('config', 'oauth.yml'))[Rails.env].with_indifferent_access

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, OAUTH_KEYS[:vk_client_id], OAUTH_KEYS[:vk_client_secret]
end
