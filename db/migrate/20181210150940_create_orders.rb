# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :item
      t.references :user
      t.string :status

      t.timestamps
    end
  end
end
