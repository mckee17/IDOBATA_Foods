class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:name]

  has_many :foods, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_foods, through: :favorites, source: :food
  has_many :follow, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followed_user, through: :follow, source: :followed

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end
