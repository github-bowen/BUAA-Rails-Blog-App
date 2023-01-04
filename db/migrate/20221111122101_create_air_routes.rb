class CreateAirRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :air_routes do |t|
      t.string :from
      t.string :to
      t.time :departure_time
      t.time :landing_time
      t.boolean :is_direct

      t.timestamps
    end
  end
end
