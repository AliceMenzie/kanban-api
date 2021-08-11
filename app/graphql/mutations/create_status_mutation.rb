module Mutations
  class CreateStatusMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    field :status, Types::StatusType, null: false
    
    argument :column, String, required: true do
      description "The column field is a string type and is required for a new status to be created."
    end

    argument :board, Integer, required: true do
      description "The id of this statuses board."
    end

    def resolve(column:, board:)
      @column = column.new(column: column, board: Board.find_by_id(board))

      if (@column.save)
        {
          column: @column,
          errors: []
        } else {
          column: nil,
          errors: @column.errors.full_messages
        }
      end
    end 

  end
end
