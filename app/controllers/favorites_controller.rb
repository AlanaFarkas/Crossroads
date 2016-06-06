class FavoritesController < ApplicationController

  def index
  	@favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
  end

  def destroy
      @favorite = Favorite.find_by(id: params[:id])
      @favorite.destroy
      redirect_to @favorites
  end

end