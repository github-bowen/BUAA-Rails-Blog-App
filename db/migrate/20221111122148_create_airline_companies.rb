class CreateAirlineCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :airline_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
