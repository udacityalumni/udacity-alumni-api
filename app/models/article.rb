class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_status

  alias_attribute :status, :article_status
  def slug
    title.parameterize
  end
end
