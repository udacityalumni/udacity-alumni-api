module AuthUserMutations
  UpdateProfile = GraphQL::Relay::Mutation.define do
    name 'UpdateProfile'
    description 'Update the user profile'
    input_field :auth_token, !types.String
    input_field :profile, ProfileInputType

    return_field :user, AuthUserType
    resolve -> (args, ctx) {
      @user = User.find_by(auth_token: args[:auth_token])
      @user.name = args[:profile][:name] if args[:profile][:name]
      @user.bio = args[:profile][:bio] if args[:profile][:bio]
      @user.avatar = args[:profile][:avatar] if args[:profile][:avatar]
      @user.email = args[:profile][:email] if args[:profile][:email]
      public_input = args[:profile][:public]
      @user.public = public_input if args[:profile][:public] != nil
      @user.save!
      {
        user: @user
      }
    }
  end
end
