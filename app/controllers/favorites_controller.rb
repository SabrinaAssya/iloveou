class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    #@favorite.user = current_user
    #@favorite.itinerary = Itinerary.find(params[:itinerary_id])
    respond_to do |format|
      if @favorite.save
        format.json { render json: { success: @favorite.save } }
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id]).destroy
    respond_to do |format|
      if @favorite.destroy
        format.json { render json: { success: @favorite.destroy } }
      end
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit(:itinerary_id, :user_id)
  end

end
