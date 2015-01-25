class ChangeLogoToImage < ActiveRecord::Migration
  def change
  	remove_column :users, :logo, :string
  	add_column :users, :image, :string
  end
end
