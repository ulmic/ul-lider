# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

unless Rails.env.development?
  Rails.application.config.assets.precompile += %w( vendor.js vendor.css *.jpg *.png )
end
Rails.application.config.assets.precompile += %w( web/* application.js application.css tabs.* reformal.js* popup* *.eot *.woff *.ttf *.svg *.otf )
