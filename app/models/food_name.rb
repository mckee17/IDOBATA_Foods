class FoodName < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :food_genres, through: :foods, source: :genre

  validates :name, presence: true, uniqueness: true

  def average_rate
    Food.where(food_name_id: id).average(:rate).round(1)
  end
end
