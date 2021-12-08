class FoodCompound < ApplicationRecord
    belongs_to :food
    belongs_to :compound
end
