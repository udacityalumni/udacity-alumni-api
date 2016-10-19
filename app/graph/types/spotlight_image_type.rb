SpotlightImageType = GraphQL::ObjectType.define do
  name 'SpotlightImage'
  description 'The type for the carousel spotlight images'
  field :id, !types.ID, 'The id of the image'
  field :url, !types.String, 'The url of the image'
end
