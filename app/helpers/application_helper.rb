# -*- coding: utf-8 -*-
module ApplicationHelper

  def default_search_form_options(options = {})
    {method: 'get', html: {class: 'form-inline'}, defaults: {label: false, required: false, :wrapper_html => {:class => 'form-group'}, :input_html => { :class => 'form-control' }}}.merge(options)
  end

  def default_form_options(options = {})
    {html: {class: 'form-horizontal'}, wrapper: :horizontal_form}.merge options
  end

  def prepare_from(from = url_for(only_path: false))
    params[:from].presence || from
  end

  def select_options_for_model_state(model)
    model_states(model).map { |x| [x.human_name, x.name] }
  end
end
