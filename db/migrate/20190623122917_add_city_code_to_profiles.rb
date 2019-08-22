# frozen_string_literal: true

class AddCityCodeToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :city_code, :string
  end
end
