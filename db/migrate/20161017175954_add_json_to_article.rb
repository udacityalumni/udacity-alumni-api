class AddJsonToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :json, :jsonb
  end
end
