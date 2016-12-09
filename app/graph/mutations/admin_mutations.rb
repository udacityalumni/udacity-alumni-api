module AdminMutations
  UpdateUser = GraphQL::Relay::Mutation.define do
    name 'UpdateUser'
    input_field :auth_token, !types.String, 'The admin auth token'
    input_field :user_id, !types.ID, 'The user ID'
    input_field :user, AdminUserInputType
    return_field :user, AuthUserType

    resolve -> (_obj, inputs, _ctx) do
      auth_token = inputs[:auth_token]
      admin = User.get_user_from_token(auth_token)
      if admin && admin.role == "admin"
        user = User.find_by(id: inputs[:user_id])
        user.name = inputs[:user][:name] if inputs[:user][:name]
        user.bio = inputs[:user][:bio] if inputs[:user][:bio]
        user.avatar = inputs[:user][:avatar] if inputs[:user][:avatar]
        user.email = inputs[:user][:email] if inputs[:user][:email]
        user.role = inputs[:user][:role] if inputs[:user][:role]
        public_input = inputs[:user][:public]
        user.public = public_input unless inputs[:user][:public].nil?
        user.save!
        {
          user: user
        }
      end
    end
  end
end
