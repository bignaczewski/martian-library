# frozen_string_literal: true

class MartianLibrarySchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
