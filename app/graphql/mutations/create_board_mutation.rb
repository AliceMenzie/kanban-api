module Mutations
  class CreateBoardMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :board, Types::BoardType, null: false
    
        argument :project, String, required: true do
          description "The project name field is a string type and is required for a new project to be created."
        end
    
        argument :author, Integer, required: true do
          description "The id of this boards user."
        end
    
        def resolve(project:, user:)
          @board = Board.new(project: project, user: User.find_by_id(user))
    
          if (@board.save)
            {
              board: @board,
              errors: []
            } else {
              board: nil,
              errors: @board.errors.full_messages
            }
          end
        end 
  end
end
