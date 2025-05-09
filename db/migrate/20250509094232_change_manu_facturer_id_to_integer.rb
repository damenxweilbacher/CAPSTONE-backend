class ChangeManuFacturerIdToInteger < ActiveRecord::Migration[8.0]
  def up
    # Create a new temporary table with the correct schema
    create_table :cars_temp, id: false do |t|
      t.integer :id
      t.string :model
      t.integer :year
      t.integer :manufacturer_id
      t.string :image_url
      # Add any other columns your cars table has
    end
    
    # Copy data, converting manufacturer_id to integer where possible
    execute <<-SQL
      INSERT INTO cars_temp 
      SELECT id, model, year, 
        CASE 
          WHEN manufacturer_id GLOB '[0-9]*' THEN CAST(manufacturer_id AS INTEGER)
          ELSE NULL
        END AS manufacturer_id,
        image_url
      FROM cars;
    SQL
    
    # Drop the original table
    drop_table :cars
    
    # Rename the temporary table to the original name
    rename_table :cars_temp, :cars
    
    # Re-add primary key and any other constraints/indexes
    execute "CREATE UNIQUE INDEX index_cars_on_id ON cars (id);"
  end

  def down
    # Create a new temporary table with the original schema
    create_table :cars_temp, id: false do |t|
      t.integer :id
      t.string :model
      t.integer :year
      t.string :manufacturer_id
      t.string :image_url
      # Add any other columns your cars table has
    end
    
    # Copy data, converting manufacturer_id back to string
    execute <<-SQL
      INSERT INTO cars_temp 
      SELECT id, model, year, 
        CAST(manufacturer_id AS TEXT) AS manufacturer_id,
        image_url
      FROM cars;
    SQL
    
    # Drop the modified table
    drop_table :cars
    
    # Rename the temporary table to the original name
    rename_table :cars_temp, :cars
    
    # Re-add primary key and any other constraints/indexes
    execute "CREATE UNIQUE INDEX index_cars_on_id ON cars (id);"
  end
end
