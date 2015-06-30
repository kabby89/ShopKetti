class AddCreatorIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :creator_id, :integer
  end
end
