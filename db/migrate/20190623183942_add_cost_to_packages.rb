# frozen_string_literal: true

class AddCostToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :cost, :string
  end
end
