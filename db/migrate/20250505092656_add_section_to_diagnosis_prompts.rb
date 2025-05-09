class AddSectionToDiagnosisPrompts < ActiveRecord::Migration[8.0]
  def change
    add_column :diagnosis_prompts, :section, :integer
  end
end
