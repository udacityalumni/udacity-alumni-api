TagInputType = GraphQL::InputObjectType.define do
  name 'TagInput'
  description 'Input type for a tag'
  input_field :tag, !types.String
end
