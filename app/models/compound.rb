class Compound < ApplicationRecord
    has_many :food_compounds
    has_many :foods
end
