class Food < ApplicationRecord
    belongs_to :food_name
    belongs_to :genre
    belongs_to :user
    has_many :food_compounds, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :compounds, through: :food_compounds
end
