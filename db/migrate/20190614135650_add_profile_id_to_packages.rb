class AddProfileIdToPackages < ActiveRecord::Migration[5.2]
  def change
    add_reference :packages, :profile, foreign_key: true
  end
end