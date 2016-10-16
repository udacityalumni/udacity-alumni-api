TagType = GraphQL::ObjectType.define do
  name 'Tag'
  description 'The article tags model'
  field :tag, !types.String, 'The tag title'
  field :articles, types[ArticleType], 'The articles associated with the tag'
end
