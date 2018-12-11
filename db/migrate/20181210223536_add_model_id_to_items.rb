class AddModelIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :model_id, :integer
  end
end
