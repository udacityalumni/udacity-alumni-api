ArticleInputType = GraphQL::InputType.define do
  name 'ArticleInput'
  description 'The input for articles for the site'
  input_field :status, ArticleStatusEnumType, 'The article status'
  input_field :content, !types.String, 'The content of the article'
  input_field :json, !types.String, 'The json content of the article'
  input_field :title, !types.String, 'The title of the article'
  input_field :feature_image, types.String, 'The featured image for the article'
  input_field :spotlighted, types.Boolean, 'Whether the article is spotlighted'
  input_field :featured, types.Boolean, 'Whether the article is featured'
  input_field :tags, -> { types[TagInputType] }, 'Tags associated with the article'
end
