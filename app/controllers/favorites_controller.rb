class FavoritesController < ApplicationController

  def index
  	@favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
  end

end