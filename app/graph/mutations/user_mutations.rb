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
  ResetPassword = GraphQL::Relay::Mutation.define do
    name 'ResetPassword'
    description 'When a user returns to the password reset route with a token to reset password'
    input_field :token, !types.String
    input_field :password, !types.String
    input_field :password_confirmation, !types.String

    return_field :user, AuthUserType
    resolve -> (inputs, _ctx) do
      user = User.find_by(reset_password_token: inputs[:token])
      if user && user.valid_password?(password)
        user.update(
          password: inputs[:password],
          password_confirmation: inputs[:password_confirmation]
        )
        user.reset_password_token = nil
        user.save!
        sign_in_user! user
        {
          user: user
        }
      end
    end
  end
end
