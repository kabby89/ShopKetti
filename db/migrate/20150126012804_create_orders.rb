class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal12 :subtotal
      t.decimal3 :subtotal
      t.decimal12 :tax
      t.decimal3 :tax
      t.decimal12 :shipping
      t.decimal3 :shipping
      t.decimal12 :total
      t.decimal3 :total
      t.references :order_status, index: true

      t.timestamps
    end
  end
end
