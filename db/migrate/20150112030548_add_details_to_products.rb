class AddDetailsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :name, :string
  	add_column :products, :description, :text
  	add_column :products, :style_number, :string
  	add_column :products, :color, :string
  	add_column :products, :size, :string
  	add_column :products, :inventory, :integer
  	add_column :products, :date_available, :date
  	add_column :products, :price, :money
  	add_column :products, :shipping_cost, :money
  	add_column :products, :user_id, :integer
  	add_index :products, [:name, :user_id, :style_number]
  end
end
