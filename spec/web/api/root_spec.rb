# frozen_string_literal: true

RSpec.describe Api::Root do
  describe 'GET /' do
    subject { get '/' }

    it 'has successful response' do
      subject
      expect(response).to be_successful
    end

    it 'returns empty object' do
      subject
      expect(JSON.parse(response.body, symbolize_names: true)).to eq({})
    end
  end

  describe 'GET /pulse' do
    subject { get '/pulse' }

    it 'has successful response' do
      subject
      expect(response).to be_successful
    end

    it 'returns empty object' do
      subject
      expect(JSON.parse(response.body, symbolize_names: true)).to eq(pulse: 'ok')
    end
  end

  describe 'GET /unknown' do
    subject { get '/unkown' }

    it 'has not found response' do
      subject
      expect(response).to be_not_found
    end

    it 'returns empty object' do
      subject
      expect(JSON.parse(response.body, symbolize_names: true)).to eq(error: 'Not found')
    end
  end
end
