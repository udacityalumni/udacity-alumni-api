class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :email, :avatar, :role
  type 'user'
end
