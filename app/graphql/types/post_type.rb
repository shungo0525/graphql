module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :user, Types::UserType, null: false
    field :comments, [Types::CommentType], null: false
  end
end
