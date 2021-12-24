class Public::HomesController < ApplicationController
  def top
    @new = Food.order(created_at: :desc).limit(3)
    @favorite = Food.includes(:favorite_users).sort { |a, b| b.favorite_users.size <=> a.favorite_users.size }
    @foods = Food.all
  end
end
