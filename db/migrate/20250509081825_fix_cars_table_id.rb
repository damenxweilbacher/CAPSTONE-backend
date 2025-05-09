class FixCarsTableId < ActiveRecord::Migration[8.0]
  def up
    # First remove the existing index
    remove_index :cars, name: "index_cars_on_id" if index_exists?(:cars, :id)
    
    # Create a new temporary table with proper auto-incrementing id
    create_table :cars_temp do |t|
      t.string :model
      t.integer :year
      t.integer :manufacturer_id
      t.string :image_url
      # Add any other columns your cars table has
    end
    
    # Copy data from the old table to the new one
    execute <<-SQL
      INSERT INTO cars_temp (model, year, manufacturer_id, image_url)
      SELECT model, year, manufacturer_id, image_url
      FROM cars
      WHERE id IS NOT NULL;
    SQL
    
    # Drop the old table
    drop_table :cars
    
    # Rename the new table to cars
    rename_table :cars_temp, :cars
  end

  def down
    # This migration is not easily reversible since we're changing the primary key structure
    raise ActiveRecord::IrreversibleMigration
  end
end