class AddBuyerAttributes < ActiveRecord::Migration
  def change
  	add_column :users, :buyer_ship_to_address_1, :string
  	add_column :users, :buyer_ship_to_address_2, :string
  	add_column :users, :buyer_ship_to_address_3, :string
  	add_column :users, :buyer_ship_to_city, :string
  	add_column :users, :buyer_ship_to_state, :string
  	add_column :users, :buyer_ship_to_zip, :string
  	add_column :users, :buyer_sold_to_address_1, :string
  	add_column :users, :buyer_sold_to_address_2, :string
  	add_column :users, :buyer_sold_to_address_3, :string
  	add_column :users, :buyer_sold_to_city, :string
  	add_column :users, :buyer_sold_to_state, :string
  	add_column :users, :buyer_sold_to_zip, :string
  	add_column :users, :buyer_company_name, :string
  	add_column :users, :buyer_description, :text
  	add_column :users, :buyer_email, :string
  	add_column :users, :buyer_phone, :string
  	add_column :users, :buyer_name, :string
  	add_column :users, :buyer_bank_routing, :string
  	add_column :users, :buyer_bank_acct, :string
  	add_column :users, :buyer_paypal_email, :string
  	add_column :users, :buyer_account_type, :string
  end
end
