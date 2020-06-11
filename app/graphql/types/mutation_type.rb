module Types
  class MutationType < Types::BaseObject
    field :delete_comment, mutation: Mutations::DeleteComment
    field :update_comment, mutation: Mutations::UpdateComment
    field :create_comment, mutation: Mutations::CreateComment
    field :delete_post, mutation: Mutations::DeletePost
    field :update_post, mutation: Mutations::UpdatePost
    field :create_post, mutation: Mutations::CreatePost

    field :test_field, String, null: false
    def test_field
      "Test"
    end
  end
end
