class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :alias
      t.references :city

      t.timestamps
    end
    add_index :companies, :city_id
  end
end
