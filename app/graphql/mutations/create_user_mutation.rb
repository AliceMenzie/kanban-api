module Mutations
  class CreateUserMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :user, Types::UserType, null: false

    argument :email, String, required: true do
      description "The email field is a string type and is required for a new User to be created."
    end

    argument :username, String, required: true do
      description "This is the Users username."
    end

    argument :password, String, required: true do
      description "The password of this User."
    end

    def resolve(email:, username:, password:)
      user = User.new(email: email, usename: username, password: password)
      # current_user needs to be set so authenticationToken can be returned
      context[:current_user] = user
      if (user.save)
        {
          user: @user,
          errors: [],
        }
      else {
        user: nil,
        errors: @user.errors.full_messages,
      }       end
    end
  end
end
