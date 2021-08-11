module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    # Add your custom classes if you have them:
    # This is used for generating payload types
    argument_class Types::BaseArgument

    # This is used for return fields on the mutation's payload
    field_class Types::BaseField

    # This is used for generating the `input: { ... }` object type
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject


    # https://github.com/rmosolgo/graphql-ruby/issues/1837
    # https://technology.doximity.com/articles/token-authentication-with-rails-vue-graphql-and-devise
    # field :success, Boolean, null: false
    # field :errors, [String], null: true

    protected

    def authorize_user
      return true if context[:current_user].present?

      raise GraphQL::ExecutionError, "User not signed in"
    end
  end
end
