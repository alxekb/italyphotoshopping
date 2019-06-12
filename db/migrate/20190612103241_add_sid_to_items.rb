class AddSidToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :size, foreign_key: true
    add_reference :items, :color, foreign_key: true
  end
end
