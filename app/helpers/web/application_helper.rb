module Web::ApplicationHelper
  def title_is(page_title = t('.title'))
    content_for(:title) { "#{page_title} | #{t('application.attributes.name')}" }
  end

  def title_is_hard(page_title = t('.title'))
    content_for(:title) { page_title }
  end

  def copyright_notice_year_range(start_year)
    start_year = start_year.to_i
    current_year = Time.new.year
    if current_year > start_year && start_year > 2000
      "#{start_year} - #{current_year}"
    elsif start_year > 2000
      "#{start_year}"
    else
      "#{current_year}"
    end
  end

  MAX_PARTICIPANTS_ON_FAIR_IDEA = 140

  def requests_to_fair_idea_needs_count(participants_on_fair_count)
    I18n.t('web.admin.need_minimum_requests_to_fair_of_idea', count: MAX_PARTICIPANTS_ON_FAIR_IDEA - participants_on_fair_count)
  end
end
