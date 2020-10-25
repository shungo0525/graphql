module Mutations
  class CreatePost < BaseMutation
    graphql_name 'CreatePost'

    field :post, Types::PostType, null: true

    argument :title, String, required: false
    argument :description, String, required: false
    argument :user_id, Integer, required: false


    def resolve(**args)
      post = Post.new(title: args[:title], description: args[:description], user_id: args[:user_id])

      post.save
      if post.save!
        post
      else
        raise GraphQL::ExecutionError, post.errors.full_messages
      end
      {
        post: post
      }
    end
  end
end
