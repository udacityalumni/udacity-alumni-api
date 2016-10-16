class SpotlightImageSerializer < ActiveModel::Serializer
  attributes :id, :url
  type 'spotlight_images'
end
