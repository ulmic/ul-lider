# encoding: utf-8

class CreativeWorkUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
