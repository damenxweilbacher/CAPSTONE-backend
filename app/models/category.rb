class Category < ApplicationRecord
has_many :diagnoses
has_many :diagnosis_prompts
end
