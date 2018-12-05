# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# BASE =========================================================================
# rails
gem 'rails', '~> 5.2.1'

# MODEL ========================================================================
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# User auth
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# VIEW =========================================================================
# decorator
gem 'draper'
# pager
gem 'kaminari'

# SEO
gem 'meta-tags'
gem 'sitemap_generator'

# JS, CSS
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# DB ===========================================================================
gem 'sqlite3'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# OTHERS =======================================================================
# SERVER
gem 'puma', '~> 3.11'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

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
  gem 'pry-byebug'
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
  gem 'letter_opener'
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
