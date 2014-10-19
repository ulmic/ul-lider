class NewsDecorator < ApplicationDecorator
  delegate_all

  def lead
    "#{model.body.first(250)}..."
  end

  def long_lead
    "#{model.body.first(600)}..."
  end
end
