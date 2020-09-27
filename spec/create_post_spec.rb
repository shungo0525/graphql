
require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          expect do
            post '/graphql', params: { query: query }
          end.to change { Post.count }.by(1)
        end

        it 'returns a task' do
          post '/graphql', params: { query: query }
          data = JSON.parse(response.body)['data']['createTask']['task']

          expect(data).to include(
            'title'           => 'title1',
            'description'     => 'description1'
          )
        end
      end

      def query
        <<~GQL
        mutation {
          createPost(
            input:{
              title: "title"
              description: "description"
            }
          ){
            post {
              id
              title
              description
            }
          }
        }
        GQL
      end
    end
  end
end
