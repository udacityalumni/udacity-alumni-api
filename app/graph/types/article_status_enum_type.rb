ArticleStatusEnumType = GraphQL::EnumType.define do
  name 'ArticleStatusEnum'
  description 'The status of the event'
  value 'draft'
  value 'published'
  value 'archived'
end
