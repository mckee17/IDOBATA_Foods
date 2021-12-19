class Public::FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
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
    @food_names = @foods.of_food_name_list
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
    @food_name =  FoodName.new(food_name_params) #field for
    @compound = Compound.new(compound_params) #field for

    FoodName.all.each do |name| #uniq->food_name.id
      @food.food_name_id = name.id if name.name == params[:food_name][:name]
    end
    if @food.food_name_id.blank? #not_uniq->food_name.id
      @food_name.save
      @food.food_name_id = @food_name.id
    end
    Compound.all.each do |compound| #uniq->compound.id
      @food.compound_id = compound.id if compound.name == params[:compound][:name]
    end
    if @food.compound_id.blank? #not_uniq->compound.id
      @compound.save
      @food.compound_id = @compound.id
    end
    @food.user_id = current_user.id if user_signed_in?
    if @food.save
      FoodCompound.create(compound_id: @food.compound_id, food_name_id: @food.food_name_id) #foodname<->compound
      redirect_to food_path(@food)
    else render :new
    end
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params) && FoodName.find(@food.food_name_id).update(food_name_params) && Compound.find(@food.compound_id).update(compound_params)
    redirect_to food_path(@food)
    else render :edit
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
    params.require(:food).permit(:function, :comment, :rate, :profile_image, :food_name_id, :genre_id, :user_id, :compound_id)
  end
  def food_name_params
    params.require(:food_name).permit(:name)
  end
  def compound_params
    params.require(:compound).permit(:name)
  end
end
