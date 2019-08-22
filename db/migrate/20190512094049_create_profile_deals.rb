# frozen_string_literal: true

class CreateProfileDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_deals do |t|
      t.references :client
      t.boolean :byed
      t.boolean :paid
      t.string :messenger
      t.references :item
      t.integer :buy
      t.integer :sell

      t.timestamps
    end
  end
end
