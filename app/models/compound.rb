class Compound < ApplicationRecord
    has_many :food_compounds, dependent: :destroy
    has_many :foods
end
