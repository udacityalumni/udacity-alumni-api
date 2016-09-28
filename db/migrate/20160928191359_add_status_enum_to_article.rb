class AddStatusEnumToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :status, :integer
  end
end
