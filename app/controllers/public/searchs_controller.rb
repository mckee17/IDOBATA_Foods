class Public::SearchsController < ApplicationController
  def search
    case params[:id]
    when "name"
      @search_names = FoodName.where('name LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
      @search_foods = Food.where(food_name_id: @search_names.ids).order(created_at: :desc)
      @search_count = @search_foods.count

    when "compound"
      @search = Compound.where('name LIKE ?', "%#{params[:word]}%")
      @search_names = FoodName.where(id: @search.joins(:foods).select(:food_name_id).distinct.pluck(:food_name_id)).order(created_at: :desc)
      @search_foods = Food.where(compound_id: @search.ids).order(created_at: :desc)
      @search_count = @search_foods.count

    when "function"
      @search_foods = Food.where('function LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
      @search_names = FoodName.where(id: @search_foods.select(:food_name_id).distinct.pluck(:food_name_id)).order(created_at: :desc)
      @search_count = @search_foods.count
    else
      @search_names = {}
      @search_foods = {}
      @search_count = 0
    end
  end
end
