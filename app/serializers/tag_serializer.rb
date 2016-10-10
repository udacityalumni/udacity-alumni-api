class TagSerializer < ActiveModel::Serializer
  attributes :id, :tag
  has_many :articles
end
