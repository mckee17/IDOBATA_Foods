class Genre < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :genre_food_names, through: :foods, source: :food_name
  
  validates :name, presence: true
end
