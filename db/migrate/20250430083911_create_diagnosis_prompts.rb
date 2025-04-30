class CreateDiagnosisPrompts < ActiveRecord::Migration[8.0]
  def change
    create_table :diagnosis_prompts do |t|
      t.string :question
      t.integer :diagnosis_id

      t.timestamps
    end
  end
end
