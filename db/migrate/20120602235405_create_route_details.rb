class CreateRouteDetails < ActiveRecord::Migration
  def change
    create_table :route_details do |t|
      t.integer :position_order
      t.boolean :is_going
      t.references :route
      t.references :route_branch

      t.timestamps
    end
    add_index :route_details, :route_id
    add_index :route_details, :route_branch_id
  end
end
