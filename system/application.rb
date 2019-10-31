# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'bundler'
require 'dry/system/container'
require 'dry/monads'
require 'dry/monads/do'

Bundler.require(:default, ENV['RACK_ENV'])

Dotenv.load(".env.#{ENV['RACK_ENV']}")

class Application < Dry::System::Container
  configure do |config|
    config.auto_register = %w[lib web]
  end

  def self.env
    @env ||= ENV['RACK_ENV']
  end

  load_paths!('lib', 'web', '.')
end

Import = Application.injector

Application.start(:persistence)

Application.finalize!
