class AddUserToSpotlightImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :spotlight_images, :user, foreign_key: true
  end
end
