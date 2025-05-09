class RemoveSectionFromDiagnosisPrompts < ActiveRecord::Migration[8.0]
  def change
    remove_column :diagnosis_prompts, :section, :integer 
  end
end
