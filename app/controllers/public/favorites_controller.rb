class Public::FavoritesController < ApplicationController
  def create
    @food = Food.find(params[:id])
    Favorite.create(user_id: current_user.id, food_id: params[:id])
    #redirect_back fallback_location: root_path
  end

  def destroy
    @food = Food.find(params[:id])
    Favorite.find_by(user_id: current_user.id, food_id: params[:id]).destroy
    #redirect_back fallback_location: root_path
  end
end
