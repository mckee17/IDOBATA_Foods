class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def followed
    @followed = current_user.followed_user
  end

  def create
    @food = Food.find(params[:id])
    Relationship.create(followed_id: @food.user_id, follow_id: current_user.id)
  end

  def destroy
    @food = Food.find(params[:id])
    Relationship.find_by(followed_id: @food.user_id, follow_id: current_user.id).destroy
  end
end
