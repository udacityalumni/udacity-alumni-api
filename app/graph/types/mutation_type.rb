MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :CreateTag, field: TagMutations::Create.field
end
