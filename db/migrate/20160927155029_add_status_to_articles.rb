class AddStatusToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :article_status
  end
end
