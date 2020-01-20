class AddAmountColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :amount, :float
    add_column :orders, :effective_amount, :float
    add_column :order_products, :amount, :float
    add_column :order_products, :effective_amount, :float
  end
end
