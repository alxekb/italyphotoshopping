# frozen_string_literal: true

class AddPackageCostToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :package_cost, :decimal
  end
end
