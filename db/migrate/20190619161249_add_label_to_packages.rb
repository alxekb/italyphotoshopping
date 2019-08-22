# frozen_string_literal: true

class AddLabelToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :label, :string
  end
end
