# frozen_string_literal: true

module Api
  class Root < Grape::API
    module PrettyJSON
      def self.call(object, _env)
        JSON.pretty_generate(JSON.parse(object.to_json)) + "\n"
      end
    end

    format :json
    formatter :json, PrettyJSON unless Application.env == 'production'

    rescue_from Exception do
      error!({ error: 'Server error' }, 500)
    end

    desc 'Root endpoint'
    get '/' do
      {}
    end

    desc 'Pulse endpoint'
    get '/pulse' do
      { pulse: :ok }
    end

    desc 'Not found endpoint'
    route :any, '*path' do
      error!({ error: 'Not found' }, 404)
    end
  end
end
