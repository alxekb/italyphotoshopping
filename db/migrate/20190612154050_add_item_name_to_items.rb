# frozen_string_literal: true

class AddItemNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :item_name, foreign_key: true
  end
end
