class CreateRouteBranches < ActiveRecord::Migration
  def change
    create_table :route_branches do |t|
      t.references :start_bus_stop
      t.references :end_bus_stop
      t.time :travel_time

      t.timestamps
    end
    add_index :route_branches, :start_bus_stop_id
    add_index :route_branches, :end_bus_stop_id
  end
end
