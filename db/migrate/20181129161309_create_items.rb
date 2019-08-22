# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item
      t.string :brand
      t.string :name
      t.string :color
      t.string :size
      t.bigint :ean
      t.bigint :art
      t.float :price
      t.integer :discount
      t.boolean :available

      t.timestamps
    end
  end
end
