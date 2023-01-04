class CreateHotelsTouristRoutesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :hotels, :tourist_routes
  end
end
