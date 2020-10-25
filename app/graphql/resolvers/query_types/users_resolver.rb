module Resolvers::QueryTypes
  class UsersResolver < GraphQL::Schema::Resolver
    type [Types::UserType], null: false
    def resolve
      User.includes(:posts).all
    end
  end
end
