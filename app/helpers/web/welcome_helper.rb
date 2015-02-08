module Web::WelcomeHelper
  def participant_info(index)
    YAML.load_file("#{Rails.root}/lib/yaml/winners_info.yml")["info"][index]
  end
  def new_participants_count
    count = User.participants.where(state: :active).count
    content_tag(:sup, count, class: 'text-primary notification') unless count == 0
  end
  def second_stage_message(participant)
    detector = RussianSex::Detector.new
    name = participant.first_name
    sex = detector.detect name
    if sex == 'M'
      I18n.t('popup.man_participant_runned_to_second_stage', name: name)
    elsif sex == 'F'
      I18n.t('popup.woman_participant_runned_to_second_stage', name: name)
    else
      if participant.patronymic.include? 'вна'
        I18n.t('popup.woman_participant_runned_to_second_stage', name: name)
      else
        I18n.t('popup.man_participant_runned_to_second_stage', name: name)
      end
    end
  end
end
