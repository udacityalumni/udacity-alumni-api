class CreateArticlestatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :articlestatuses do |t|
      t.string :title

      t.timestamps
    end
  end
end
