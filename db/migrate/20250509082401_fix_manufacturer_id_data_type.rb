class FixManufacturerIdDataType < ActiveRecord::Migration[8.0]
  def up
    # Check which database adapter we're using
    if ActiveRecord::Base.connection.adapter_name.downcase == 'postgresql'
      # PostgreSQL syntax
      execute <<-SQL
        ALTER TABLE cars 
        ALTER COLUMN manufacturer_id TYPE integer 
        USING (CASE WHEN manufacturer_id ~ '^[0-9]+$' 
                    THEN manufacturer_id::integer 
                    ELSE NULL 
               END);
      SQL
    else
      # SQLite syntax - create a new table with the correct schema
      create_table :cars_temp do |t|
        t.string :model
        t.integer :year
        t.integer :manufacturer_id
        t.string :image_url
        # Add any other columns your cars table has
      end
      
      # Copy data, converting manufacturer_id to integer where possible
      execute <<-SQL
        INSERT INTO cars_temp (model, year, manufacturer_id, image_url)
        SELECT model, year, 
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
    end
  end

  def down
    change_column :cars, :manufacturer_id, :string
  end
end
