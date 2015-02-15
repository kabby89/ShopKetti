class AddCreatorIdToOrdrs < ActiveRecord::Migration
  def change
  	add_column :orders, :creator_id, :integer
  end
end
