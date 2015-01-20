class SkuDatabaseToSkus < ActiveRecord::Migration
  def change
  		rename_table :sku_databases, :skus
  		drop_table :gems
  end
end
