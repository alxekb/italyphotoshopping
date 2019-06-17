class RemoveItemIdFromPackages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :packages, :item, foreign_key: true
  end
end
