class CreateTouristRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :tourist_routes do |t|
      t.string :origin
      t.string :destination
      t.integer :total_days
      t.integer :cost
      t.string :agency

      t.timestamps
    end
  end
end
