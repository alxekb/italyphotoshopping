class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.string :model_id
      t.string :integer

      t.timestamps
    end
  end
end
