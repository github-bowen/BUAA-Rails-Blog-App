class AddUserIdToTouristRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :tourist_routes, :user_id, :integer
    add_index :tourist_routes, :user_id
  end
end
