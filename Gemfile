# frozen_string_literal: true

source 'https://rubygems.org'

gem 'grape'
gem 'pg'
gem 'pry'
gem 'puma'
gem 'rake'

gem 'dotenv'
gem 'zeitwerk'

gem 'dry-container'

gem 'rom'
gem 'rom-sql'

group :development do
  gem 'overcommit', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
  gem 'shotgun'
  gem 'solargraph', require: false
end

group :development, :test do
  gem 'factory_bot'
  gem 'faker'
  gem 'rack-test'
  gem 'rspec'
  gem 'rspec-expectations'
  gem 'simplecov', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-mocks'
end
