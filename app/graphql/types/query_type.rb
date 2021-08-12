module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :users, [Types::UserType], null: false do
      description "Query that selects all users."
    end

    def users
      return User.all
    end

    # User query
    field :user, UserType, null: true do
      description "Find a user by id"
      argument :id, String, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end

    field :boards, [Types::BoardType], null: false do
      description "Query that selects all boards."
    end

    def boards
      return Board.all
    end

    field :statuses, [Types::StatusType], null: false do
      description "Query that selects all statuses."
    end

    def statuses
      return Status.all
    end

    field :tasks, [Types::TaskType], null: false do
      description "Query that selects all tasks."
    end

    def tasks
      return Task.all
    end
  end
end
