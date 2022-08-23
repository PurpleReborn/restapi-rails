class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :product_name
      t.string :description
      t.integer :price
      t.timestamps

    end
  end
end