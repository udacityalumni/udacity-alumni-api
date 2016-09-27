class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.references :user
      t.boolean :featured, default: false
      t.boolean :spotlighted, default: false
      t.text :content, null: false
      t.string :feature_image

      t.timestamps
    end
  end
end
