class AddTouristRouteToHotels < ActiveRecord::Migration[7.0]
  def change
    add_reference :hotels, :tourist_route, null: true, foreign_key: true
  end
end
