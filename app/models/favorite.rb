class Favorite < ApplicationRecord
  belongs_to :food
  belongs_to :user

  validates :user_id, presence: true
  validates :food_id, presence: true
end
