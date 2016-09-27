class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, default: '', null: false
    add_column :users, :avatar, :string
  end
end
