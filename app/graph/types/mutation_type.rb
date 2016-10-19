MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :CreateTag, field: TagMutations::Create.field
  field :SaveAll, field: TagMutations::SaveAll.field

  field :UpdateArticle, field: ArticleMutations::Update.field

  field :CreateSpotlightImage, field: SpotlightImageMutations::Create.field
  field :CreateSpotlightImage, field: SpotlightImageMutations::Update.field
  field :CreateSpotlightImage, field: SpotlightImageMutations::Delete.field
end
