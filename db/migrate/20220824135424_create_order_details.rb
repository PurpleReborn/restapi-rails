class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|

      t.references :order
      t.references :product
      t.integer :qty
      t.float :price
      t.timestamps
    end
  end
end
