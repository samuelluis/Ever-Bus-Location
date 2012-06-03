class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.references :start_bus_stop
      t.references :end_bus_stop
      t.references :company

      t.timestamps
    end
    add_index :routes, :start_bus_stop_id
    add_index :routes, :end_bus_stop_id
    add_index :routes, :company_id
  end
end
