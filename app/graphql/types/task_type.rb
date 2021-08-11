module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false do
      description "This is Tasks id."
    end
    field :title, String, null: true do
      description "This is Tasks title."
    end
    field :description, String, null: true do
      description "This is Tasks desciption."
    end
    field :status_id, Integer, null: false do
      description "This is Tasks Status id"
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is Tasks time/date created at."
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is Tasks time/date updated at."
    end
  end
end
