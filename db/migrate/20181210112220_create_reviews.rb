class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :index
      t.string :new
      t.string :edit
      t.string :show

      t.timestamps
    end
  end
end
