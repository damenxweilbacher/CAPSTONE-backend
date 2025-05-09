class Diagnosis < ApplicationRecord
  has_many :diagnosis_prompts
  belongs_to :category
end
