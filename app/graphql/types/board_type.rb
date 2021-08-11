module Types
  class BoardType < Types::BaseObject
    field :id, ID, null: false do
      description "This is Boards id."
    end
    field :project, String, null: true do
      description "This is Boards project name."
    end
    field :user_id, Integer, null: false do
      description "This is Boards User id."
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is Boarrds time/date created at."
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is Boards time/date updated at."
    end
  end
end