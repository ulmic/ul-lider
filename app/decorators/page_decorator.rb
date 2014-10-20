class PageDecorator < ApplicationDecorator
  delegate_all

  def lead
    "#{model.body.first(250)}..."
  end
end
