TagType = GraphQL::ObjectType.define do
  name 'Tag'
  description 'The article tags model'
  field :id, !types.ID, 'The tag id'
  field :tag, !types.String, 'The tag title'
  field :slug, !types.String, 'The tag slug'
  field :articles, types[ArticleType], 'The articles associated with the tag'
end
