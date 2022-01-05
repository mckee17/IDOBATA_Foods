class Food < ApplicationRecord
  belongs_to :food_name
  belongs_to :genre
  belongs_to :user, optional: true
  belongs_to :compound
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  attachment :image

  validates :function, presence: true
  validates :rate, presence: true
  validates :compound_id, presence: true
  validates :food_name_id, presence: true
  validates :genre_id, presence: true

  def safe_image?
    Vision.check_safe_image(self.image).values.all?{|i| i == "VERY_UNLIKELY" || i == "UNLIKELY"}
  end
end