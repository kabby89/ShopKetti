class UpdateImagesToNewModel < ActiveRecord::Migration
  def change
  		remove_column :products, :images, :json
  end
end
