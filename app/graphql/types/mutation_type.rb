module Types
  class MutationType < Types::BaseObject
    field :create_task_mutation, mutation: Mutations::CreateTaskMutation
    field :create_status_mutation, mutation: Mutations::CreateStatusMutation
    field :create_board_mutation, mutation: Mutations::CreateBoardMutation
    field :create_user_mutation, mutation: Mutations::CreateUserMutation
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
