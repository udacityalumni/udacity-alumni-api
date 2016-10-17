class Tag < ApplicationRecord
  has_and_belongs_to_many :articles
  validates :tag, presence: true, uniqueness: { case_sensitive: false }

  def slug
    tag.parameterize
  end
end
