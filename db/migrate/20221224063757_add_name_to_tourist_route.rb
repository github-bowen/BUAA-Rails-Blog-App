class AddNameToTouristRoute < ActiveRecord::Migration[7.0]
  def change
    add_column :tourist_routes, :name, :string,
               null: false, unique: true
  end
end
