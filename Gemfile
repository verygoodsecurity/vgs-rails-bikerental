source 'https://rubygems.org'

# ruby 2.0.0 required for Heroku deployment, 1.9.3 works locally
ruby '2.3.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.3.5'

# update this if you update activerecord
gem 'sqlite3', '~> 1.3.6'

gem 'tzinfo-data', '~> 1.2020.1'

gem 'thin'

gem 'rack-cors'

gem 'stripe'

gem 'nokogiri', '~> 1.11.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.8'

# We need rubyracer to use less
gem 'therubyracer'

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.4.0'

# devise for authentication
gem 'devise', '>= 4.7.2'

gem 'protected_attributes'
gem 'less-rails', '~> 2.8.0'

group :development do
  gem 'quiet_assets', '>= 1.1.0'
  gem 'foreman'
  gem 'dotenv'
  gem 'dotenv-rails', '>= 2.7.6'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '>= 1.1.0', require: false
end
