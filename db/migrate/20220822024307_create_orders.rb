class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :payment_method
      t.integer :amount
      t.timestamps
    end
  end
end
