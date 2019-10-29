# frozen_string_literal: true

class DryGrape::App < Grape::API
  module PrettyJSON
    def self.call(object, _env)
      JSON.pretty_generate(JSON.parse(object.to_json)) + "\n"
    end
  end

  def self.env
    @env ||= ENV['RACK_ENV']
  end

  format :json
  formatter :json, PrettyJSON unless env == 'production'

  rescue_from Exception do
    error!({ error: 'Server error' }, 500)
  end

  get '/' do
    {}
  end

  get '/pulse' do
    { pulse: :ok }
  end

  route :any, '*path' do
    error!({ error: 'Not found' }, 404)
  end

  def env
    self.class.env
  end
end
