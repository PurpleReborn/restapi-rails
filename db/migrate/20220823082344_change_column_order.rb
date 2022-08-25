class ChangeColumnOrder < ActiveRecord::Migration[6.0]
  def change
      rename_column :orders, :payment_method, :status
      remove_column :orders, :amount
  end
end
