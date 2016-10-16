class SpotlightImage < ApplicationRecord
  validates :url, presence: true
  # Each spotlight_image will belong to a user
  belongs_to :user
end
