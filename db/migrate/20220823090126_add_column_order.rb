class AddColumnOrder < ActiveRecord::Migration[6.0]
  def change
      add_column :orders, :date, :timestamp
      add_column :orders, :total, :float
      add_reference :orders, :customer, foreign_key: true
  end
end
