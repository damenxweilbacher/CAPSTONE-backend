class ChangeManuFacturerIdToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :cars, :manufacturer_id, :integer
  end
end
