class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|


      t.timestamps
    end
    	add_index :products, [:name, :user_id, :style_number]
  end
end
