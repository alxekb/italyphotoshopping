class AddMeasurmentsToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :h, :integer
    add_column :deals, :w, :integer
    add_column :deals, :l, :integer
    add_column :deals, :weight, :integer
    add_reference :deals, :package, foreign_key: true
  end
end
