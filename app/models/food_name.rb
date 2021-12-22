class FoodName < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def average_rate
    Food.where(food_name_id: id).average(:rate).round(1)
  end
end
