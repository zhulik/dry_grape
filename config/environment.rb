# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

Bundler.require(:default, ENV['RACK_ENV'])

loader = Zeitwerk::Loader.new
loader.push_dir('api')
loader.setup
