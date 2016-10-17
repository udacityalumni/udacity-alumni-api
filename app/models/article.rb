class Article < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  # The default status is Draft, so the order needs
    # to stay as it is for now.
  enum status: [:draft, :published, :archived]

  def slug
    title.parameterize
  end
end
