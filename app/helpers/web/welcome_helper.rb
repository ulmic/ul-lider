module Web::WelcomeHelper
  def winner_info(index)
    YAML.load_file("#{Rails.root}/lib/yaml/winners_info.yml")["info"][index]
  end
  def new_participants_count
    count = User.participants.where(state: :active).count
    count unless count == 0
  end
  def new_fair_participants_count
    count = User.fair_participants.where(state: :active).count
    count unless count == 0
  end
end
