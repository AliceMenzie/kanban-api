module Types
  class StatusType < Types::BaseObject
    field :id, ID, null: false do
      description "This is Statuses id."
    end
    field :column, String, null: true do
      description "This is Statuses column."
    end
    field :board_id, Integer, null: false do
      description "This is Statuses Board id."
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is Status time/date created at."
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is Status time/date updated at."
    end
  end
end
