class FavoritesController < ApplicationController

  def index
  	@user = current_user
  	@favorites = @user.favorites
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
  end

  def destroy
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
      redirect_to favorites_path
  end

end