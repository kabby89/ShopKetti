class CreateSkuDatabases < ActiveRecord::Migration
  def change
    create_table :sku_databases do |t|
    	t.integer :product_id
    	t.integer :color_id
    	t.integer :size_id
    	t.integer :inventory
    	t.decimal :price_per_unit
    	t.date :date_available

      t.timestamps
    end
  end
end
