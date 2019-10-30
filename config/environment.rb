# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'bundler'

Bundler.require(:default, ENV['RACK_ENV'])

class Application
  def initialize
    @loader = Zeitwerk::Loader.new
    @loader.push_dir('web')
    @loader.push_dir('lib')
  end

  def env
    @env ||= ENV['RACK_ENV']
  end

  def setup
    @loader.setup
  end

  def eager_load!
    @loader.eager_load
  end

  def load_environment!
    require_relative(File.join('environments', env))
  end
end

app = Application.new
app.setup
System.register(:app, app)

Dotenv.load(".env.#{System[:app].env}")

Dir[File.join(File.expand_path('initializers', __dir__), '*.rb')].each { |file| require file }

app.load_environment!
