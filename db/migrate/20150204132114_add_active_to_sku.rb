class AddActiveToSku < ActiveRecord::Migration
  def change
  	add_column :skus, :active, :boolean
  end
end
