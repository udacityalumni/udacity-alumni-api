module SpotlightImageMutations
  Create = GraphQL::Relay::Mutation.define do
    input_field :auth_token, !types.String
    input_field :url, !types.String

    return_field :spotlight_image, SpotlightImageType
    resolve -> (inputs, ctx) do
      user = User.find_by(auth_token: inputs[:auth_token])
      image = SpotlightImage.create(
        url: inputs[:url],
        user: user
      )
      image
    end
  end
  Update = GraphQL::Relay::Mutation.define do
    input_field :auth_token, !types.String
    input_field :id, !types.ID
    input_field :url, !types.String

    return_field :spotlight_image, SpotlightImageType
    resolve -> (inputs, ctx) do
      user = User.find_by(auth_token: inputs[:auth_token])
      image = SpotlightImage.find_by(id: inputs[:id])
      image.update(url: inputs[:url], user: user)
      image
    end
  end
  Delete = GraphQL::Relay::Mutation.define do
    input_field :auth_token, !types.String
    input_field :id, !types.ID

    return_field :deletedId, !types.ID

    image = SpotlightImage.find_by_id(inputs[:id])
    deletedId = image.id
    image.destroy
    deletedId
  end
end
