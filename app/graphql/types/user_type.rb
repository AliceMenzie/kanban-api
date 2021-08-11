module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false do
      description "This Users id."
    end
    field :email, String, null: false do
      description "This is Users email."
    end
    field :encrypted_password, String, null: false do
      description "This is  Users encrypted password."
    end
    field :reset_password_token, String, null: true do
      description "This is  Users reset password token."
    end
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true do
      description "This is  Users time/date reset password was sent at."
    end
    field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true do
      description "This is Users time/date remember was created at."
    end
    field :username, String, null: true do
      description "This is Users username."
    end
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is date/time User was created."
    end
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This is date/time User was updated."
    end
# authentication token 
    field :authentication_token, String, null: false
    def authentication_token
      if object.gql_id != context[:current_user]&.gql_id
        raise GraphQL::UnauthorizedFieldError,
              "Unable to access authentication_token"
      end

      object.authentication_token
    end
  end
end
