class PageDecorator < ApplicationDecorator
  delegate_all

  def lead
    "#{model.body.first(250)}..."
  end

  def description_lead
    "#{model.body.first(200)}..."
  end

  def with_own_view?
    object.view.present?
  end
end
