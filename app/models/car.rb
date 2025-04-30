class Car < ApplicationRecord
  validates :year, presence: true
  validates :year, numericality: {less_than_or_equal_to: 2025}
  validates :model, presence: true

  # association to manufacturers (child model)
  belongs_to :manufacturer
end
