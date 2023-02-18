class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.itinerary = Itinerary.find(params[:itinerary_id])
    @favorite.save
  end

  def destroy
    Favorite.find(params[:id]).destroy
  end

  private
  def favorite_params
    params.require(:favorite).permit(:itinerary_id, :user_id)
  end

end
