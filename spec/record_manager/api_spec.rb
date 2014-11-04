# encoding: utf-8

require 'spec_helper'
require 'rack/test'

describe RecordManager::API do
  include Rack::Test::Methods

  def app
    RecordManager::API
  end

  context 'GET' do
    context '/records/gender' do
      it 'successfully responds' do
        get '/records/gender'
        expect(last_response.status).to eq 200
      end
    end

    context '/records/name' do
      it 'successfully responds' do
        get '/records/name'
        expect(last_response.status).to eq 200
      end
    end

    context '/records/birthdate' do
      it 'successfully responds' do
        get '/records/birthdate'
        expect(last_response.status).to eq 200
      end
    end
  end

  context 'POST /records' do
    context 'pipe delimited' do
      before do
        post '/records', { record: 'Fry | Philip | Male | Orange | 12-11-1987' }
      end
      
      it 'responds successfully' do
        expect(last_response.status).to eq 201
      end

      it 'returns the right JSON' do
        expect(last_response.body).to eq %Q({"record":{"last_name":"Fry","first_name":"Philip","gender":"Male","favorite_color":"Orange","birthdate":"12/11/1987"}})
      end
    end

    context 'when missing params' do
      it 'returns a 400' do
        post '/records'
        expect(last_response.status).to eq 400
      end
    end
  end
end