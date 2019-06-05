class CreateProfileItems < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_items do |t|
      t.string :item
      t.string :brand
      t.string :color
      t.integer :price
      t.integer :cost

      t.timestamps
    end
  end
end
