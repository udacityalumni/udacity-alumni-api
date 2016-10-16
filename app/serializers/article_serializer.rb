class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :featured,
             :spotlighted, :content, :feature_image,
             :status, :slug, :user,
             :created_at, :updated_at
  has_many :tags
end
