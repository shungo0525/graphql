
require 'rails_helper'

RSpec.describe 'post mutation', type: :request do
  subject { post graphql_path, params: { query: query } }

  let!(:user_post) { FactoryBot.build(:post) }

  let(:query) do
    <<~QUERY
      mutation{
        createPost(input:{
          title: "#{user_post.title}"
          description: "#{user_post.description}"
        }) {
          post{
            title
            description
          }
        }
      }
    QUERY
  end

  it 'response body is User data' do
    subject
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:createPost][:post][:title]).to eq user_post.title
  end
end
