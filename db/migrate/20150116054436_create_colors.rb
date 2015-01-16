class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
    	t.integer :product_id
    	t.string :hue

      t.timestamps
    end
  end
end
