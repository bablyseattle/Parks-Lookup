require 'rails_helper'

describe 'Parks-Lookup API', :type => :request do

  let!(:parks) { FactoryBot.create_list(:park, 20) }
  let(:park_id) { parks.first.id }

  #  test suite for GET /parks
  describe 'GET /parks' do
    before { get '/parks' }

    it 'returns parks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  # test suite for GET /parks/:id
  describe 'GET /parks/:id' do
    before { get "/parks/#{park_id}" }

    context 'when the record exists' do
      it 'returns the park' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(park_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:park_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Park/)
      end
    end
  end

  # test suite for POST /parks
  describe 'POST /parks' do
    let(:valid_attributes) { { name: 'Lake Park', state: 'WA'} }

    context 'when the request is valid' do
      before { post '/parks', params: valid_attributes }

      it 'creates a park' do
        expect(json['name']).to eq('Lake Park')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/parks', params: { name: 'mem park' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: State can't be blank/)
      end
    end
  end

end