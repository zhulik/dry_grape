# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'bundler'

Bundler.require(:default, ENV['RACK_ENV'])

class Application
  include Singleton

  def initialize
    @loader = Zeitwerk::Loader.new
    @loader.push_dir('web')
  end

  def env
    @env ||= ENV['RACK_ENV']
  end

  def setup
    @loader.setup
    load_environment!
  end

  def eager_load!
    @loader.eager_load
  end

  private

  def load_environment!
    require_relative(File.join('environments', env))
  end
end

Application.instance.setup
