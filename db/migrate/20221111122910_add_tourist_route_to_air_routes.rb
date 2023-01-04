class AddTouristRouteToAirRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :air_routes, :tourist_route, null: true, foreign_key: true
  end
end
