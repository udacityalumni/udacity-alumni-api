QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The root level query type'

  field :articles, types[ArticleType] do
    argument :tag, types.String
    argument :first, types.Int

    resolve -> (_obj, args, _ctx) do
      articles = Article.where(status: 'published')
      if args[:tag]
        tag = Tag.where(tag: args[:tag]).first
        tag.articles.where(status: 'published')
      elsif args[:first]
        articles.first(args[:first])
      else
        articles
      end
    end
  end
  field :articleFeedCount, types.Int do
    resolve -> (_obj, args, _ctx) {
      Article.where(status: 'published', spotlighted: false).count
    }
  end
  field :articleFeed, types[ArticleType] do
    argument :first, types.Int
    resolve -> (_obj, args, _ctx) do
      articles = Article.where(spotlighted: false, status: 'published')
      if args[:first]
        articles.first(args[:first])
      else
        articles
      end
    end
  end
  field :article, ArticleType do
    argument :id, types.ID
    argument :slug, types.String
    resolve -> (_obj, args, _ctx) do
      if args[:slug]
        Article.find_by(slug: args[:slug])
      else
        Article.find_by(id: args[:id])
      end
    end
  end
  field :tags, types[TagType] do
    resolve -> (_obj, args, _ctx) do
      Tag.all
    end
  end
  field :tag, TagType do
    argument :id, types.ID
    resolve -> (_obj, args, _ctx) do
      tag = Tag.find_by(id: args[:id])
      tag
    end
  end
  field :spotlightImages, types[SpotlightImageType] do
    resolve -> (_obj, args, _ctx) do
      SpotlightImage.all
    end
  end
  field :spotlightImage, SpotlightImageType do
    argument :id, types.ID
    resolve -> (_obj, args, _ctx) do
      image = SpotlightImage.find_by(id: args[:id])
      image
    end
  end
  field :authUser, AuthUserType do
    argument :auth_token, !types.String
    resolve -> (_obj, args, _ctx) do
      auth_token = args[:auth_token]
      User.get_user_from_token(auth_token)
    end
  end
  field :publicUsers, types[UserType] do
    resolve -> (_obj, args, _ctx) do
      User.where(public: true)
    end
  end
  field :user, UserType do
    argument :id, !types.ID
    resolve -> (_obj, args, _ctx) do
      User.where(public: true, id: args[:id]).first
    end
  end
  field :feedback, types[FeedbackType] do
    argument :auth_token, !types.String
    resolve -> (_obj, args, _ctx) do
      auth_token = args[:auth_token]
      User.get_user_from_token(auth_token)
      if user && user.role == 'admin'
        Feedback.all
      end
    end
  end
end
