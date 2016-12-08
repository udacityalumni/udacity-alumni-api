AdminUserInputType = GraphQL::InputObjectType.define do
  name 'AdminUserInput'
  description 'Admin user interactions via content dashboard'
  input_field :name, types.String, 'The name of the user'
  input_field :email, types.String, 'The email of the user'
  input_field :bio, types.String, 'The bio of the user'
  input_field :avatar, types.String, 'The user avatar'
  input_field :role, types.String, 'The user role'
  input_field :public, types.Boolean, 'Whether the user is public or not'
end
