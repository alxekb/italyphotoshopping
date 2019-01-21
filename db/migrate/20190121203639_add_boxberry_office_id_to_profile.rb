class AddBoxberryOfficeIdToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :boxberry_office_id, :string
  end
end
