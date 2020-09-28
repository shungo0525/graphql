module Resolvers
  module QueryTypes
    class UsersResolver < GraphQL::Schema::Resolver
      type [Types::UserType], null: false
      def resolve
        User.includes(:posts).all
        # User.all
      end
    end
  end
end
