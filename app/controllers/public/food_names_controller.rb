class Public::FoodNamesController < ApplicationController
  def show
    @food_name = FoodName.find(params[:id])
    @foods = @food_name.foods
  end
end
