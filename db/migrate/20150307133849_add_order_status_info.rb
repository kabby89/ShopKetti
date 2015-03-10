class AddOrderStatusInfo < ActiveRecord::Migration
  def change
  	add_column :orders, :order_shipped, :string
  	add_column :orders, :order_sh_date, :datetime
  	add_column :orders, :ship_type, :string
  	add_column :orders, :tracking, :string
  	add_column :orders, :eta, :datetime
  	add_column :orders, :returned, :string
  	add_column :orders, :return_date, :datetime
  end
end
