class ChangePhoneToBeBigintInProfiles < ActiveRecord::Migration[5.2]
  # def change_table :profiles do |t|
  #   t.change :phone, :bigint
  #   t.change :passport_number, :bigint
  # end

  def up
    change_column :profiles, :phone, :bigint
    change_column :profiles, :passport_number, :bigint
  end

  def down
    change_column :profiles, :phone, :integer
    change_column :profiles, :passport_nimber, :integer
  end

end
