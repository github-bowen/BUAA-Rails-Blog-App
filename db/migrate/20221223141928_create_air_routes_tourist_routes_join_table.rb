class CreateAirRoutesTouristRoutesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :air_routes, :tourist_routes
  end
end
