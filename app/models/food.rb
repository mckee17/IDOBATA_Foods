class Food < ApplicationRecord
    belongs_to :food_name
    belongs_to :genre
    belongs_to :user, optional: true
    belongs_to :compound
    has_many :favorites, dependent: :destroy

    def self.of_food_name_list
        food_names = []
        self.select(:food_name_id).distinct.each do |f|
        food_names << f.food_name
        end
        return food_names
    end
end
