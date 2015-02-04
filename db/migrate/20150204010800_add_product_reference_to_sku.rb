class AddProductReferenceToSku < ActiveRecord::Migration
  def change
  	add_reference :skus, :product_id
  end
end
