source 'https://rubygems.org'

gem 'rails', '4.0.3'
gem 'sass-rails'
gem 'activesupport', require: 'active_support'
gem 'uglifier'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'slim'
gem 'bson_ext'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'bcrypt'
gem 'bootstrap-sass', '~> 3.1.1.0'

group :assets do
  gem 'coffee-rails'
end

group :development, :test do
  # gem "better_errors"
  gem 'pry'
  gem "binding_of_caller"
  gem "letter_opener"
  gem 'bootstrap-datepicker-rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
