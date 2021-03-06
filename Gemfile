# frozen_string_literal: true

source 'https://rubygems.org'

gem 'grape'
gem 'pg'
gem 'pry'
gem 'puma'
gem 'rake'

gem 'dotenv'

gem 'dry-container'
gem 'dry-monads'
gem 'dry-system'
gem 'dry-validation'

gem 'bcrypt'

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
  gem 'rack-test'
  gem 'rspec'
  gem 'rspec-expectations'
  gem 'simplecov', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'rom-factory'
  gem 'rspec-mocks'
end
