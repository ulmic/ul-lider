# -*- coding: utf-8 -*-
module BootstrapHelper
  ALERT_TYPES = [:error, :info, :success, :warning, :danger]

  def menu_item(name=nil, path="#", *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    content_tag :li, :class => is_active?(path, options) do
      name, path = path, options if block_given?
      link_to name, path, options, &block
    end
  end

  def links_menu_item(name=nil, path="#", *args, &block)
    path = name || path if block_given?
    options = args.extract_options!
    if is_active?(path, options)
      content_tag :li, class: 'active' do
        content_tag :a, name, class: 'active-link'
      end
    else
      content_tag :li do
        name, path = path, options if block_given?
        link_to name, path, options, &block
      end
    end
  end

  def is_active?(path, options={})
    "active" if uri_state(path, options).in?([:active, :chosen])
  end

  def display_errors(model)
    return unless model.errors.any?
    #FIXME мб можно аккуратнее сделать
    raw(model.errors.map do |attribute, message|
           content_tag(:span, message, class: "error")
         end.join(" "))
  end

  # Returns current url or path state (useful for buttons).
  # Example:
  #   # Assume we'r currently at blog/categories/test
  #   uri_state('/blog/categories/test', {})               # :active
  #   uri_state('/blog/categories', {})                    # :chosen
  #   uri_state('/blog/categories/test', {method: delete}) # :inactive
  #   uri_state('/blog/categories/test/3', {})             # :inactive
  def uri_state(uri, options={})
    root_url = request.host_with_port + '/'
    root = uri == '/' || uri == root_url

    request_uri = if uri.start_with?(root_url)
      request.url
    else
      request.path
    end

    if !options[:method].nil? || !options["data-method"].nil?
      :inactive
    elsif uri == request_uri || (options[:root] && (request_uri == '/') || (request_uri == root_url))
      :active
    else
      if request_uri.start_with?(uri) and not(root)
        :chosen
      else
        :inactive
      end
    end
  end

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :warning if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type.to_sym)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
