class Public::FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
    @food_name = @food.food_name.name
    @food_genre = @food.genre.name
    @food_user = @food.user.name
    @food_compound = Compound.find(FoodCompound.find_by(food_id: params[:id]).compound_id).name
  end
  def index
  end
  def new
    @food = Food.new
    @food_name = FoodName.new
    @compound = Compound.new
  end
  def edit
    @food = Food.find(params[:id])
    @food_name = @food.food_name.name
    @compound = @food.compounds.name
  end
  def create
    @food = Food.new(food_params)
    @food_name = FoodName.new(food_name_params) #field for
    @compound = Compound.new(compound_params) #field for
    @food.user_id = current_user.id if user_signed_in?
    if @food_name.save && @compound.save
      @food.food_name_id = @food_name.id  #food_name.create -> id取得
        if @food.save
          @food.food_compounds.create(compound_id: @compound.id) #中間テーブル
        else render :new
        end
      redirect_to food_path(@food)
    else render :new
    end
  end
  def update
  end
  def destroy
    if Food.find(params[:id]).destroy
    redirect_to root_path
    else render :show
    end
  end

  private

  def food_params
    params.require(:food).permit(:function, :comment, :rate, :profile_image, :food_name_id, :genre_id, :user_id)
  end
  def food_name_params
    params.require(:food_name).permit(:name)
  end
  def compound_params
    params.require(:compound).permit(:name)
  end
end
