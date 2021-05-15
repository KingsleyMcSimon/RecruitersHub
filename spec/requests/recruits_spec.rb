require 'rails_helper'

describe 'Recruits API', type: :request do
  it 'returns all Recruits' do
    FactoryBot.create(:recruit, title: '1984', author: 'Kings McSimon')
    FactoryBot.create(:recruit, title: 'The Time Machine', author: 'H.G Well')

    get '/api/v1/recruits'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end
