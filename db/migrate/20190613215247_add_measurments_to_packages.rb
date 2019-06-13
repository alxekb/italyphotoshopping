class AddMeasurmentsToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :h, :integer
    add_column :packages, :w, :integer
    add_column :packages, :l, :integer
    add_column :packages, :weight, :integer
    add_reference :packages, :package, foreign_key: true
    add_column :packages, :tracking_code, :string
    add_column :packages, :shipping_status, :string
    add_column :packages, :active, :boolean
  end
end
