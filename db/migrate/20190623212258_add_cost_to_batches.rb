class AddCostToBatches < ActiveRecord::Migration[5.2]
  def change
    add_column :batches, :cost, :decimal, default: 0
  end
end
