class AddPackageCostToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :package_cost, :string
  end
end
