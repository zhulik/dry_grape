# frozen_string_literal: true

source 'https://rubygems.org'

gem 'grape'
gem 'puma'
gem 'zeitwerk'

group :development do
  gem 'overcommit', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'shotgun'
  gem 'solargraph', require: false
end

group :development, :test do
  gem 'factory_bot'
  gem 'faker'
  gem 'pry'
  gem 'pry-rescue'
  gem 'rspec'
  gem 'simplecov', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-mocks'
end
