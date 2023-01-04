class AddTouristRouteIdToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :tourist_route_id, :integer, null: false
  end
end
