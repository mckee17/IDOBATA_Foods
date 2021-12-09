class FoodName < ApplicationRecord
    has_many :foods
    has_many :food_compounds
end
