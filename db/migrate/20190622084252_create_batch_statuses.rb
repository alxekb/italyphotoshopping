# frozen_string_literal: true

class CreateBatchStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :batch_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
