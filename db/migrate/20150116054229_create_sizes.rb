class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
    	t.string :measurement
    	t.integer :product_id

      t.timestamps
    end
  end
end
