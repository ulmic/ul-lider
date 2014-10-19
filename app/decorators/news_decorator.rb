class NewsDecorator < ApplicationDecorator
  delegate_all

  def lead
    "#{model.body.first(250)}..."
  end
end
