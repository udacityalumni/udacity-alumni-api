AuthenticationTokenType = GraphQL::ObjectType.define do
  name 'AuthenticatonToken'
  description 'The authentication tokens'
  field :body, types.String, 'The body of the token'
end
