class AddSkusToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :sku_id, :integer
  end
end
