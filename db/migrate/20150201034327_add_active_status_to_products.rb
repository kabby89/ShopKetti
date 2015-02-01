class AddActiveStatusToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :active, :boolean
  end
end
