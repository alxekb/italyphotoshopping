class AddCityCodeToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :city_code, :integer
  end
end
