require "types/query_type"

class UsersSchema < GraphQL::Schema
  query(Types::QueryType)
end
