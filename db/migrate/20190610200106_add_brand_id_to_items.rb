# frozen_string_literal: true

class AddBrandIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :brand, foreign_key: true
    # this string won't go down. Comment it out before rolling down.
    add_reference :items, :model, foreign_key: true
  end
end
