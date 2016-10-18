MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :CreateTag, field: TagMutations::Create.field
  field :SaveAll, field: TagMutations::SaveAll.field

  field :UpdateArticle, field: ArticleMutations::Update.field
end
