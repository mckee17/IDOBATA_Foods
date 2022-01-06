class Admin::FoodsController < ApplicationController
  def index
    @foods = Food.select(:compound_id, :image_id).page(params[:page])
  end
end
