source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'mysql2', '~> 0.5.2'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
#gem 'bootstrap-sass', '>= 3.4.1'
gem 'bootstrap', '~> 5.0.0.alpha1'

gem 'railties', '~> 5.0', '>= 5.0.0.1'

gem 'uglifier', '>= 1.3.0'
gem 'mini_racer', platforms: :ruby
#gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'haml-rails'
gem 'rouge'
gem 'resque', require: 'resque/server'
#gem 'resque-job-stats'

gem 'httparty'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'rb-readline'
  gem 'rubocop'

  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  #gem 'capybara', '>= 2.15'
  #gem 'selenium-webdriver'
  #gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
