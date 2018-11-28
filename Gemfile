# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# rails
gem 'rails', '~> 5.2.1'
# rails base gems
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# User auth
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# pager
gem 'kaminari'

# SEO
gem 'meta-tags'
gem 'sitemap_generator'

group :development, :test do
  # speed up
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Rspec test
  gem 'factory_bot_rails'
  gem 'faker'
  # pry
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-remote'
  # Rspec
  gem 'email_spec'
  gem 'rspec'
  gem 'rspec-rails'
  # テスト高速化
  gem 'guard', '>= 2.2.2', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'rack-livereload'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
