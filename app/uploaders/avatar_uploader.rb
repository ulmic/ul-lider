# encoding: utf-8

class AvatarUploader < ApplicationUploader

  include ImageDefaults

  def default_url
    ActionController::Base.helpers.asset_path("images/default_avatar.png")
  end

  version :medium do
    process :resize_to_fill => [400, 400, 'North']
  end

  version :small do
    process :resize_to_fill => [100, 100, 'North']
  end
end
