class Admin::FoodsController < ApplicationController
  def index
    @foods = Food.where.not(image_id: nil).select(:id, :compound_id, :image_id)
    @foods = @foods.select{|m| m.image_data_Structural_formula?}
    @foods = Kaminari.paginate_array(@foods).page(params[:page])
  end
end
