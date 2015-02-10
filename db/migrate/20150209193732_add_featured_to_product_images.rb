class AddFeaturedToProductImages < ActiveRecord::Migration
  def change
  	add_column :product_images, :featured, :boolean
  end
end
