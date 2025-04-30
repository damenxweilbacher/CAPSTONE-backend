class CreateManufacturers < ActiveRecord::Migration[8.0]
  def change
    create_table :manufacturers do |t|
      t.string :country
      t.string :name

      t.timestamps
    end
  end
end
