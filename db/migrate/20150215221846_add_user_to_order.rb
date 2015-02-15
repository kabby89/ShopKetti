class AddUserToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :user_id, :integer
  	add_column :users, :order_id, :integer
  end
end
