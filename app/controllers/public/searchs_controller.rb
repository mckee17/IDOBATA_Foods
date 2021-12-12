class Public::SearchsController < ApplicationController
  def search
    case params[:id]
      when "name"
        @search = FoodName.where('name LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
        @search_count = 0
        @search.each do |name|
          @search_count += name.foods.count
        end
      when "compound"
        @search = Compound.where('name LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
        @search_count = 0
        @search.each do |compound|
          @search_count += compound.foods.count
        end
      when "function"
        @search_foods = Food.where('function LIKE ?', "%#{params[:word]}%").order(created_at: :desc)
        @search_count = @search_foods.count
      else
        @search = {}
        @seach_count = 0
    end
  end
end
