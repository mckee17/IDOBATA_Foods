class Public::FoodNamesController < ApplicationController
  def create
    FoodName.create(food_name_params)
  end
  def update
    FoodName.find(params[:id]).update(food_name_params)
  end
  def destroy
    FoodName.find(params[:id]).destroy
  end

  private

  def food_name_params
    params.require(:food_name).permit(:name)
  end
end
