class AddCategoryIdToDiagnosisPrompts < ActiveRecord::Migration[8.0]
  def change
    add_column :diagnosis_prompts, :category_id, :integer
  end
end
