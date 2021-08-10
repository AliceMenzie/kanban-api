module Types
  class StatusType < Types::BaseObject
    field :id, ID, null: false
    field :column, String, null: true
    field :board_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
