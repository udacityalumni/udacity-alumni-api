class Tag < ApplicationRecord
  has_and_belongs_to_many :articles
  validates :tag, presence: true

  def slug
    tag.parameterize
  end
end
