# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'administrate'
gem 'aws-sdk-s3', require: false
gem 'bootstrap'
gem 'bootstrap-datepicker-rails', '~> 1.6', '>= 1.6.4.1'
gem 'bootstrap_form'
gem 'carrierwave', '~> 1.0'
gem 'devise', '~> 4.5'
gem 'devise_invitable', '~> 2.0.0'
gem 'devise-i18n'
gem 'devise-bootstrap-views', '~> 1.1'
gem 'faraday', '~> 0.15.4'
gem 'faraday_middleware', '~> 0.13.1'
gem 'friendly_id', '~> 5.2.4'
gem 'haml-rails'
gem 'high_voltage', '~> 3.1'
gem 'rails-i18n', '~> 5.1'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'json', '~> 2.2'
gem 'mini_magick', '>= 4.9.4'
gem 'pagy', '~> 3.5', '>= 3.5.1'
gem 'popper_js', '~> 1.9', '>= 1.9.9'
gem 'pundit'
gem 'rest-client', '~> 2.0', '>= 2.0.2'
gem 'searchkick'
gem 'select2-rails', '~> 4.0', '>= 4.0.3'
gem 'sendgrid-ruby'
gem 'tabler-rubygem'
#
# https://rubygems.org/gems/devise
gem 'bugsnag', '~> 6.11'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.2.rc1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# https://www.rubydoc.info/github/stympy/faker#installing
# gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveUser has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'churn'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
  # gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  # end
  # gem 'capistrano-rails'
  # gem 'capistrano-bundler'
  # gem 'capistrano-rbenv'
  # gem 'capistrano3-puma'
  # gem 'capistrano'
  # gem 'capistrano-rvm'
  # gem 'capistrano-figaro-yml', '~> 1.0.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'rspec-rails', '~> 3.8'
  gem 'spring-commands-rspec'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'faker'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[x64_mingw jruby]
