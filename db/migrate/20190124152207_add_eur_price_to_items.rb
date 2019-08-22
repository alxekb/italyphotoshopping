# frozen_string_literal: true

class AddEurPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :eur_price, :integer
  end
end
