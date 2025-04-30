class AddManufacturerIdToCars < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :manufacturer_id, :string
  end
end
