source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Ruby on Rails
gem 'rails', '5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '1.1.4'
# Use Puma as the app server
gem 'puma', '3.12.1'
# Bootstrap(Sass)
gem 'bootstrap-sass', '3.4.1'
gem 'sass-rails', '5.1.0'
# jquery
gem 'jquery-rails', '4.3.5'
# バリデーションメッセージの日本語化
gem 'rails-i18n', '5.1.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.20'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.9.1'
# Use ActiveModel has_secure_password
gem 'bcrypt', '3.1.13'
# 画像投稿(header, profile)
gem 'carrierwave', '2.0.1'
gem 'fog', '2.2.0'
gem 'mini_magick', '4.9.5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.5', require: false
# Test Framework
gem 'rspec', '3.8.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
