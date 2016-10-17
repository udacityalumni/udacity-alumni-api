MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :CreateTag, field: TagMutations::Create.field
  field :SaveAll, field: TagMutations::SaveAll.field

  field :Create, field: ArticleMutations::Create.field
  field :Update, field: ArticleMutations::Update.field
  field :Delete, field: ArticleMutations::Delete.field
end
