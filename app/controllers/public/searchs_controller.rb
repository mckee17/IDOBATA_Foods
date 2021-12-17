class Public::SearchsController < ApplicationController
  def search
    case params[:id]
      when "name"
        @search_names = FoodName.where('name LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
        @search_count = 0
        @search_names.each do |name|
          @search_count += name.foods.count
        end
      when "compound"
        @search = Compound.where('name LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
        @search_count = 0
        @search.each do |compound|
          @search_count += compound.foods.count
        end
        @search_names = FoodName.where(id: @search.joins(:foods).select(:food_name_id).distinct.pluck(:food_name_id))
        @search_foods = Food.where(compound_id: @search.ids)

      when "function"
        @search_foods = Food.where('function LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
        @search_names = @search_foods.of_food_names
        @search_count = @search_foods.count
      else
        @search = {}
        @seach_count = 0
    end
  end
end
