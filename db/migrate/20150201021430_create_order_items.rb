class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
    	t.references :sku, index: true
    	t.references :order, index: true
    	t.decimal :price_per_unit, precision: 12, scale: 3
    	t.integer :quantity
    	t.decimal :total_price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
