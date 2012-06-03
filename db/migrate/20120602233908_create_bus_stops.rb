class CreateBusStops < ActiveRecord::Migration
  def change
    create_table :bus_stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.references :city

      t.timestamps
    end
    add_index :bus_stops, :city_id
  end
end
