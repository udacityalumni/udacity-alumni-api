module AuthUserMutations
  UpdateProfile = GraphQL::Relay::Mutation.define do
    name 'UpdateProfile'
    description 'Update the user profile'
    input_field :auth_token, !types.String
    input_field :profile, ProfileInputType

    return_field :user, AuthUserType
    resolve -> (_obj, inputs, _ctx) do
      auth_token = inputs[:auth_token]
      user = User.get_user_from_token(auth_token)
      user.name = inputs[:profile][:name] if inputs[:profile][:name]
      user.bio = inputs[:profile][:bio] if inputs[:profile][:bio]
      user.avatar = inputs[:profile][:avatar] if inputs[:profile][:avatar]
      user.email = inputs[:profile][:email] if inputs[:profile][:email]
      public_input = inputs[:profile][:public]
      user.public = public_input unless inputs[:profile][:public].nil?
      user.save!
      {
        user: user
      }
    end
  end
end
