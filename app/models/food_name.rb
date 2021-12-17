class FoodName < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :food_compounds
    validates :name, presence: true, uniqueness: true
end
