class AddDetailsForWepay < ActiveRecord::Migration
  def change
  	add_column :users, :wepay_access_token, :string
  	add_column :users, :wepay_account_id, :string
  end
end
