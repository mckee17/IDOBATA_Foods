class FoodCompound < ApplicationRecord
  belongs_to :food_name
  belongs_to :compound
end
