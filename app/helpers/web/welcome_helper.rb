module Web::WelcomeHelper
  def winner_info(index)
    YAML.load_file("#{Rails.root}/lib/yaml/winners_info.yml")["info"][index]
  end
end
