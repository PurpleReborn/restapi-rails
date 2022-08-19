class AddColumnStatusUser < ActiveRecord::Migration[6.0]
  def change
    create_table :status do |t|
      t.string :status_name
      t.timestamps
    end
  end
end
