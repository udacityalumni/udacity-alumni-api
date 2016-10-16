class CreateSpotlightImages < ActiveRecord::Migration[5.0]
  def change
    create_table :spotlight_images do |t|
      t.string :url

      t.timestamps
    end
  end
end
