class AddAirlineCompanyToAirRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :air_routes, :airline_company, null: true, foreign_key: true
  end
end
