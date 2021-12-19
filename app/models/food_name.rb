class FoodName < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :food_compounds
    validates :name, presence: true, uniqueness: true

    def average_rate
        Food.where(food_name_id: self.id).average(:rate).round(1)
    end
end
