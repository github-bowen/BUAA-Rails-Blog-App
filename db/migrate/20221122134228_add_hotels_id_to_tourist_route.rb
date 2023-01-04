class AddHotelsIdToTouristRoute < ActiveRecord::Migration[7.0]
  def change
    add_column :tourist_routes, :hotels_id, :integer,
               array: true, default: []
  end
end
