require 'rails_helper'

RSpec.describe 'users query', type: :request do
  subject { post graphql_path, params: { query: query } }

  let!(:user) { FactoryBot.create(:user) }

  let(:query) do
    <<~QUERY
      {
        users {
          id
          email
          name
        }
      }
    QUERY
  end

  it 'response body is User data' do
    subject
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:users][0][:id].to_i).to eq user.id
    expect(json[:data][:users][0][:email]).to eq user.email
    expect(json[:data][:users][0][:name]).to eq user.name
  end
end
