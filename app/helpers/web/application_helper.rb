module Web::ApplicationHelper
  def title_is(page_title = t('.title'))
    content_for(:title) { "#{page_title} | #{t('application.attributes.name')}" }
  end

  def title_is_hard(page_title = t('.title'))
    content_for(:title) { page_title }
  end
end
