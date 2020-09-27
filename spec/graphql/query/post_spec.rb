# require 'rails_helper'

# RSpec.describe 'post query', type: :request do
#   subject { post graphql_path, params: { query: query } }

#   let!(:post) { FactoryBot.create(:post) }

#   let(:query) do
#     <<~QUERY
#     {
#       post(id: 1) {
#         id
#         title
#         description
#       }   
#     }
#     QUERY
#   end

#   it 'response body is Post data' do
#     binding.pry
    
#     subject
#     json = JSON.parse(response.body)
#     expect(json['data']['post']['title']).to eq task.title
#     expect(json['data']['post']['description']).to eq task.description
#   end
# end
