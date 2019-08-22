# frozen_string_literal: true

class AddBatchIdToPackages < ActiveRecord::Migration[5.2]
  def change
    add_reference :packages, :batch, foreign_key: true
  end
end
