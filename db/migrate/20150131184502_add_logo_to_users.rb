class AddLogoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :logo, :string
  	remove_column :users, :image, :string
  end
end
