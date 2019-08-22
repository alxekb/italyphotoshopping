# frozen_string_literal: true

class AddPaymentStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_status, :string
  end
end
