class Public::FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])

  end

  def index
    #followed_user or current_user
    if params[:id] == "followed"
      @foods = Food.where(user_id: params[:user])
    elsif params[:id] == "current"
      @foods = Food.where(user_id: current_user.id)
    end
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
    @food_name = FoodName.new(food_name_params) #field for -> create変更？
    @compound = Compound.new(compound_params) #field for -> create変更？
    @food.user_id = current_user.id if user_signed_in?
    @food.food_name_id = @food_name.id if @food_name.save
    @food.compound_id = @compound.id if @compound.save
    if @food.save
      FoodCompound.create(compound_id: @compound.id, food_name_id: @food_name.id) #中間テーブル
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
