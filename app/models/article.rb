class Article < ApplicationRecord
  belongs_to :user

  def slug
    title.parameterize
  end
  enum status: [:draft, :published, :archived]
end
