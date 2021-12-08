class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:name]
         
  has_many :foods
  has_many :favorites
  has_many :follow, class_name:"Relationship", foreign_key:"follow_id"
  has_many :followed, class_name:"Relationship", foreign_key:"followed_id"
  
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end