class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.references :product, index: true
      t.references :order, index: true      
      t.timestamps
    end
  end
end
