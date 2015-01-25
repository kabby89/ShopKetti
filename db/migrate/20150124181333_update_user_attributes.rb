class UpdateUserAttributes < ActiveRecord::Migration
  def change
  	remove_column :users, :seller_company_name, :string
  	remove_column :users, :buyer_company_name, :string
  	add_column :users, :company_name, :string
  	remove_column :users, :seller_company_description, :text
  	remove_column :users, :buyer_description, :text
  	add_column :users, :company_description, :text
  	remove_column :users, :seller_email, :string
  	remove_column :users, :buyer_email, :string
  	remove_column :users, :paypal_email, :string
  	remove_column :users, :seller_logo, :string
  	add_column :users, :logo, :string
  	remove_column :users, :buyer_bank_routing, :string
  	remove_column :users, :buyer_bank_acct, :string
  	remove_column :users, :buyer_paypal_email, :string
  	remove_column :users, :buyer_account_type, :string
  	add_index :users, [:logo]
  	add_index :users, [:company_name, :logo, :company_description]
  	add_index :users, [:seller_address_1, :seller_address_2, :seller_city, :seller_state, :seller_zipcode, :seller_telephone, :email], :name => 'seller_address_index'
  	add_index :users, [:buyer_ship_to_address_1, :buyer_ship_to_address_2, :buyer_ship_to_address_3, :buyer_ship_to_city, :buyer_ship_to_state, :buyer_ship_to_zip, :email, :buyer_sold_to_address_1, :buyer_sold_to_address_2, :buyer_sold_to_address_3, :buyer_sold_to_city, :buyer_sold_to_state, :buyer_sold_to_zip], :name => ':buyer_address_index'
  end
end
