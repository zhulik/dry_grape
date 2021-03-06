# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../system/application', __dir__)

module RequestHelpers
  def self.included(base)
    base.include Rack::Test::Methods
  end

  def app
    described_class
  end

  def response
    last_response
  end
end

DatabaseCleaner[:sequel, connection: Application['persistence.config'][:default].connection].strategy = :truncation

Dir[File.join(__dir__, 'support/**/*.rb')].each(&method(:require))

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  config.include RequestHelpers, type: :request

  config.define_derived_metadata(file_path: Regexp.new('/spec/web/')) do |metadata|
    metadata[:type] = :request
  end

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
