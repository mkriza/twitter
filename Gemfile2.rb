# frozen_string_literal: true

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.6'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootstrap', '~> 5.0.2'
gem 'devise', '~> 4.8'
gem 'i18n-js'
gem 'rubocop', require: false
gem 'jquery-rails'
