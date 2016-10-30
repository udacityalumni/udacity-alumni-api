class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :email, :avatar, :role, :public
  type 'user'
end
