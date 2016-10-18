class AddIndexToTags < ActiveRecord::Migration[5.0]
  def change
    add_index :tags, :tag, unique: true
  end
end
