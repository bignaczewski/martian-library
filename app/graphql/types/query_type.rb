# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :items,
          [Types::ItemType],
          null:        false,
          description: 'Returns a list of items in the martian library'

    def items
      Item.all
    end

    field :me, Types::UserType, null: true, description: 'Returns the current user'
    def me
      context[:current_user]
    end
  end
end
