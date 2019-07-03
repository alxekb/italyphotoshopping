class AddDeliveryPaidToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :delivery_paid, :boolean, default: false
  end
end
