module Mutations
  class UpdatePost < BaseMutation
    graphql_name 'UpdatePost'

    field :post, Types::PostType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    def resolve(**arg)
      post = Post.find(arg[:id])
      post.update(title: arg[:title], description: arg[:description])
      {
        post: post,
        result: post.errors.blank?
      }
    end
  end
end
