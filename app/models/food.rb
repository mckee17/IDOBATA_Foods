class Food < ApplicationRecord
    belongs_to :food_name
    belongs_to :genre
    belongs_to :user, optional: true
    belongs_to :compound
    has_many :favorites, dependent: :destroy

end
