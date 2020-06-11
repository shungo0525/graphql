module Mutations
  class UpdateComment < BaseMutation
    graphql_name 'UpdateComment'

    field :comment, Types::CommentType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true
    argument :content, String, required: true

    def resolve(**args)
      comment = Comment.find(args[:id])
      comment.update(content: args[:content])
      {
        comment: comment,
        result: comment.errors.blank?
      }
    end
  end
end
