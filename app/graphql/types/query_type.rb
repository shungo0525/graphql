module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end

    # ページネーション有り(pagination)
    field :posts_pagination, Types::PostType.connection_type, null: false
    def posts_pagination(**args)
      Post.all
    end

    field :post, Types::PostType, null: false do
      argument :id, Int, required: false
    end
    def post(id:)
      Post.find(id)
    end

    # N+1問題を考慮
    field :comments, [Types::CommentType], null: false
    def comments
      Comment.includes(:post).all
    end
  end
end
