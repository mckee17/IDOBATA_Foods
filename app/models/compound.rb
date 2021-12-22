class Compound < ApplicationRecord
  has_many :food_compounds, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :food_names, through: :foods, source: :food_name

  validates :name, presence: true, uniqueness: true
end
