class CreateBusLogStops < ActiveRecord::Migration
  def change
    create_table :bus_log_stops do |t|
      t.references :bus
      t.references :bus_stop

      t.timestamps
    end
    add_index :bus_log_stops, :bus_id
    add_index :bus_log_stops, :bus_stop_id
  end
end
