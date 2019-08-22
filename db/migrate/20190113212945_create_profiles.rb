# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.string :second_name
      t.string :surname
      t.integer :phone
      t.integer :country_code
      t.string :email
      t.integer :passport_code
      t.integer :passport_number
      t.date :passport_date_issue
      t.string :passport_issuer
      t.integer :notification_number
      t.integer :notification_code
      t.integer :inn
      t.date :dob

      t.timestamps
    end
  end
end
