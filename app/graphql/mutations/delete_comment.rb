module Mutations
  class DeleteComment < BaseMutation
    graphql_name 'DeleteComment'

    field :comment, Types::CommentType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      comment = Comment.find(args[:id])
      comment.destroy
      {
        comment: comment,
        result: comment.errors.blank?
      }
    end
  end
end
