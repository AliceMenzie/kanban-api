module Mutations
  class CreateTaskMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
    field :task, Types::TaskType, null: false

    argument :title, String, required: true do
      description "The title field is a string type and is required for a new Task to be created."
    end

    argument :description, String, required: true do
      description "This is the task's main content, expects a string."
    end

    argument :status, Integer, required: true do
      description "The id of this tasks status."
    end

    def resolve(title:, description:, status:)
      @task = Task.new(title: title, description: description, status: Status.find_by_id(status))

      if @task.save
        {
          task: @task,
          errors: [],
        }
      else {
        task: nil,
        errors: @task.errors.full_messages,
      }       end
    end
  end
end
