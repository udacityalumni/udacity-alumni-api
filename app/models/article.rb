class Article < ApplicationRecord
  belongs_to :article_status
  belongs_to :user
  alias_attribute :status, :article_status
end
