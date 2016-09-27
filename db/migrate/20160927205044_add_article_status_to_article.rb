class AddArticleStatusToArticle < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :article_status, foreign_key: true
  end
end
