class Public::RelationshipsController < ApplicationController
  def followed
    @followed = current_user.followed_user
  end

  def create
    @food = Food.find(params[:id])
    Relationship.create(followed_id: @food.user_id, follow_id: current_user.id)
    #redirect_back fallback_location: root_path
  end

  def destroy
    @food = Food.find(params[:id])
    Relationship.find_by(followed_id: @food.user_id, follow_id: current_user.id).destroy
    #redirect_back fallback_location: root_path
  end
end
