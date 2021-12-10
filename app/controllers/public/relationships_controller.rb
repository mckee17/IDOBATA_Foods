class Public::RelationshipsController < ApplicationController
  def followed
    @followed = current_user.followed_user
  end

  def create
    Relationship.create(followed_id: params[:id], follow_id: current_user.id)
    redirect_back fallback_location: root_path
  end

  def destroy
    Relationship.find_by(followed_id: params[:id], follow_id: current_user.id).destroy
    redirect_back fallback_location: root_path
  end
end
