class Manufacturer < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true

  # association to car (parent model)
  has_many :cars
end
