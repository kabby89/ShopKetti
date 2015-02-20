class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
    	t.integer :order_id
    	t.text :notes
    	t.decimal :amount, precision: 12, scale: 3

      t.timestamps
    end
    add_index :exchanges, :order_id
  end
end
