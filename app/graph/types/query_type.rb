QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The root level query type'

  field :articles, types[ArticleType] do
    resolve -> (obj, args, ctx) do
      Article.all
    end
  end
  field :article, ArticleType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      article = Article.find_by(id: args[:id])
      article
    end
  end
  field :tags, types[TagType] do
    Tag.all
  end
  field :tag, TagType do
    resolve -> (obj, args, ctx) do
      tag = Tag.find_by(id: args[:id])
      tag
    end
  end
end
