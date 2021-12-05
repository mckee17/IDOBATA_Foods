class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:name]

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end