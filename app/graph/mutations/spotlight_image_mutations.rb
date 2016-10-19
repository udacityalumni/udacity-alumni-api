module SpotlightImageMutations
  Create = GraphQL::Relay::Mutation.define do
    input_field :auth_token, !types.String
    input_field :url, !types.String

    return_field :spotlight_image, SpotlightImageType
  end
  Update = GraphQL::Relay::Mutation.define do

  end
  Delete = GraphQL::Relay::Mutation.define do

  end
end
