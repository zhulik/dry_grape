# frozen_string_literal: true

class DryGrape::App < Grape::API
  format :json

  get '/' do
    {}
  end

  get '/ping' do
    { ping: 'pong' }
  end

  route :any, '*path' do
    error!({ error: 'Not found' }, 404)
  end
end
