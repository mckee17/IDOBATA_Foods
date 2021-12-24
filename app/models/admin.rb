class Admin < ApplicationRecord
  devise :database_authenticatable,
         :rememberable, :validatable, authentication_keys: [:email]
end
