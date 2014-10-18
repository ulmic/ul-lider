class NewsDecorator < ApplicationDecorator
  delegate_all

  def lead
    "#{model.body.first(200)}..."
  end
end
