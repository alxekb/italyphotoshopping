class AddPhotosToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :photos, :json
  end
end
