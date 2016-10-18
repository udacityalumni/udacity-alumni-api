module ArticleMutations
  Update = GraphQL::Relay::Mutation.define do
    name 'UpdateArticle'
    input_field :auth_token, !types.String
    input_field :id, !types.ID
    input_field :article, ArticleInputType

    return_field :article, ArticleType
    resolve -> (inputs, ctx) do
      user = User.find_by(auth_token: inputs[:auth_token])
      article_inputs = inputs[:article]
      if user
        article = Article.find_by_id(inputs[:id])
        article.update(article_inputs)
        article.save!
      end
    end
  end
end
