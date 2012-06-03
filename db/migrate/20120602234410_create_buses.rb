class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.string :code
      t.references :company
      t.references :route

      t.timestamps
    end
    add_index :buses, :company_id
    add_index :buses, :route_id
  end
end
