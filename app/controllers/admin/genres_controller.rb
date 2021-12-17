class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    @genre.save
      #redirect_back fallback_location: admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @genre.destroy
      #redirect_back fallback_location: admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
