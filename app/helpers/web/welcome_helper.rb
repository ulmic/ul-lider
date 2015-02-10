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
  def view_of_creative_work(participant)
    if participant.creative_work.present? and participant.url_creative_work.present?
      content_tag :div do
        concat content_tag(:a, I18n.t('popup.link_to_creative_work_part1'), href: participant.creative_work, class: 'btn btn-branded')
        concat content_tag(:a, I18n.t('popup.link_to_creative_work_part2'), href: participant.url_creative_work, class: 'btn btn-branded')
      end
    elsif participant.url_creative_work.present?
      content_tag(:a, I18n.t('popup.link_to_creative_work'), href: participant.url_creative_work, class: 'btn btn-branded')
    elsif participant.creative_work.present?
      content_tag(:a, I18n.t('popup.link_to_creative_work'), href: participant.creative_work, class: 'btn btn-branded')
    end
  end
end
