class AddSlugToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :slug, :string, default: ''
  end
end
