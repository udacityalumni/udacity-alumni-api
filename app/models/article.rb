class Article < ApplicationRecord
  belongs_to :user
  has_one :article_status

  alias_attribute :status, :article_status
  def slug
    title.parameterize
  end
end
