class FavoritesController < ApplicationController
  def create
    Favorite.create(favorite_params)
  end

  def destroy
    Favorite.find(params[:id]).destroy
  end

  private
  def favorite_params
    params.require(:favorite).permit(:itinerary_id, :user_id)
  end

end
