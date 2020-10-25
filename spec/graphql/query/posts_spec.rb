require 'rails_helper'

RSpec.describe 'posts query', type: :request do
  subject { post graphql_path, params: { query: query } }

  let!(:user_post) { FactoryBot.create(:post) }
  # let!(:user) { FactoryBot.create(:user) }

  let(:query) do
    <<~QUERY
      {
        posts {
          id
          title
          description
        }
      }
    QUERY
  end

  it 'response body is User data' do
    subject
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:posts][0][:id].to_i).to eq user_post.id
  end
end
