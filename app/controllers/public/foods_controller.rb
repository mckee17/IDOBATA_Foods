class Public::FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @food_name = @food.food_name
  end

  def index
    case params[:id]
    when "followed"
      @foods = Food.where(user_id: params[:user])
    when "current"
      @foods = Food.where(user_id: current_user.id)
    when "favorite"
      @foods = current_user.favorite_foods
    else
      @foods = Food.all
    end
    @food_names = FoodName.where(id: @foods.select(:food_name_id).distinct.pluck(:food_name_id))
  end

  def new
    @food = Food.new
    @food_name = FoodName.new
    @compound = Compound.new
  end

  def edit
    @food = Food.find(params[:id])
    @food_name = FoodName.find(@food.food_name_id)
    @compound = Compound.find(@food.compound_id)
  end

  def create
    @food = Food.new(food_params)
    @food_name = FoodName.find_by(name: params[:food_name][:name]) # field for
    @compound = Compound.find_by(name: params[:compound][:name]) # field for

    if @food_name.nil?
      @food_name = FoodName.new(food_name_params)
      @food_name.save
    end
      @food.food_name_id = @food_name.id
    if @compound.nil?
      @compound = Compound.new(compound_params)
      @compound.save
    end
      @food.compound_id = @compound.id
    @food.user_id = current_user.id if user_signed_in?
    if @food.save
      if @food.image.present? && !@food.safe_image? # Vision API/SafeSearch
        File.delete("#{Rails.root}/public/uploads/#{@food.image.id}")
        @food.update(image_id: nil)
      end
        redirect_to food_path(@food)
    else
      render :new
    end
  end

  def update
    @food = Food.find(params[:id])
    @food_name = FoodName.find_by(name: params[:food_name][:name]) # field for
    @compound = Compound.find_by(name: params[:compound][:name]) # field for

    if @food_name.nil?
      @food_name = FoodName.new(food_name_params)
      @food_name.save
    end
      @food.food_name_id = @food_name.id
    if @compound.nil?
      @compound = Compound.new(compound_params)
      @compound.save
    end
      @food.compound_id = @compound.id
    if @food.update(food_params)
      if @food.image.present? && !@food.safe_image? # Vision API/SafeSearch
        File.delete("#{Rails.root}/public/uploads/#{@food.image.id}")
        @food.update(image_id: nil)
      end
        redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    if Food.find(params[:id]).destroy
      redirect_to root_path
    else render :show
    end
  end

  private

  def food_params
    params.require(:food).permit(:function, :comment, :rate, :image, :food_name_id, :genre_id, :user_id, :compound_id)
  end

  def food_name_params
    params.require(:food_name).permit(:name)
  end

  def compound_params
    params.require(:compound).permit(:name)
  end
end
