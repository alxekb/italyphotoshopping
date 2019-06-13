class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.references :profile, foreign_key: true
      t.references :item, foreign_key: true
      t.decimal :bye
      t.decimal :sell
      t.string :status
      t.string :messenger
      t.boolean :paid
      t.boolean :ransom
      t.text :comment
      t.string :payment_method

      t.timestamps
    end
  end
end
