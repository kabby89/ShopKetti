class RemoveDetailsFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :color, :string
  	remove_column :products, :size, :string
  	remove_column :products, :inventory, :integer
  	remove_column :products, :date_available, :date
  	remove_column :products, :price, :money
  end
end
