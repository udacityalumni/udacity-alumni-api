class AddNonNullToArticleStatusesTitle < ActiveRecord::Migration[5.0]
  def change
    change_column :article_statuses, :title, :string, null: false
  end
end
