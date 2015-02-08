module Web::WelcomeHelper
  def participant_info(index)
    YAML.load_file("#{Rails.root}/lib/yaml/winners_info.yml")["info"][index]
  end
  def new_participants_count
    count = User.participants.where(state: :active).count
    content_tag(:sup, count, class: 'text-primary notification') unless count == 0
  end
end
