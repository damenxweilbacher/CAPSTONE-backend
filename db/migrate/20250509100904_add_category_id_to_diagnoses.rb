class AddCategoryIdToDiagnoses < ActiveRecord::Migration[8.0]
  def change
    add_column :diagnoses, :category_id, :integer
  end
end
