# frozen_string_literal: true

class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.references :batch_status, foreign_key: true

      t.timestamps
    end
  end
end
