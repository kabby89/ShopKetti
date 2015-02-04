class CleanUpSkus < ActiveRecord::Migration
  def change
  	remove_column :skus, :product_id_id, :integer
  end
end
