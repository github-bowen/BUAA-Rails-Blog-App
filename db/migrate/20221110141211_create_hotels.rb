class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :types
      t.integer :rate
      t.string :location

      t.timestamps
    end
  end
end
