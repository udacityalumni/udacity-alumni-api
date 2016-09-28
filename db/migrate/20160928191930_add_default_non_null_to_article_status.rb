class AddDefaultNonNullToArticleStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :status, :integer, null: false, default: 0
  end
end
