class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.references :user
      t.references :item, foreign_key: true
      t.integer :shipping_type
      t.integer :pup_code

      t.timestamps
    end
  end
end
