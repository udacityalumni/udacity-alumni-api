module UserMutations
  RequestPasswordInstructions = GraphQL::Relay::Mutation.define do
    name 'RequestPasswordInstructions'
    description 'When a user requests that their password be reset, send them an email'
    input_field :email, !types.String

    return_field :success, types.Boolean
    resolve -> (inputs, ctx) do
      user = User.find_by(email: inputs[:email])
      if user
        user.send_reset_password_instructions
        {
          success: true
        }
      else
        {
          success: false
        }
      end
    end
  end
end
