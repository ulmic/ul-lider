module Web::WelcomeHelper
  def winner_info(index)
    YAML.load_file("#{Rails.root}/lib/yaml/winners_info.yml")["info"][index]
  end
  def new_users_count
    count = User.participants.where(state: :active).count
    count unless count == 0
  end
end
