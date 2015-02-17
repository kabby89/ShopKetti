class ChangeOrderOrderstatusToString < ActiveRecord::Migration
  def change
  	change_column :orders, :order_status_id, :string
  end
end
