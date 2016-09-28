class Article < ApplicationRecord
  belongs_to :user
  # The default status is Draft, so the order needs
    # to stay as it is for now.
  enum status: [:draft, :published, :archived]

  def slug
    title.parameterize
  end
end
