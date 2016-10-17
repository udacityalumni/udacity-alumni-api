QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The root level query type'

  field :articles, types[ArticleType] do
    argument :tag, types.String
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      if args[:tag]
        tag = Tag.where(tag: args[:tag]).first
        tag.articles
      elsif args[:id]
        Article.find_by_id(args[:id])
      else
        Article.all
      end
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
    resolve -> (obj, args, ctx) do
      Tag.all
    end
  end
  field :tag, TagType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      tag = Tag.find_by(id: args[:id])
      tag
    end
  end
end
