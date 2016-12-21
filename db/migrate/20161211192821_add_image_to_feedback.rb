class AddImageToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :image, :binary
  end
end
