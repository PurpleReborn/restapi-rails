class AddColumnCityToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :address, :string
    add_column :user_profiles, :is_married, :boolean, default: false
  end
end
