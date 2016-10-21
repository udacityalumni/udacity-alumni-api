UserRoleEnum = GraphQL::EnumType.define do
  name 'UserRole'
  description 'The user role enum'
  value('user', 'The regular user type', value: 0)
  value('author', 'The author user type', value: 1)
  value('admin', 'The admin user type', value: 2)
end
