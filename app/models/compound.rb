class Compound < ApplicationRecord
    has_many :food_compounds, dependent: :destroy
    has_many :foods
    validates :name, presence: true, uniqueness: true
end
