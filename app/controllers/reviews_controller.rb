class ReviewsController < ApplicationController
  before_action :set_itinerary

  def index
    @review = Review.where(itinerary: Itinerary.find(params[:itinerary_id])) #cherche la review dans un itineraire donné
  end

  def new
    @review = Review.new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @review.user = current_user
  end

  def create
    @review = Review.new(review_params) # mandatory de tout renseigner pour un path complet
    @itinerary = Itinerary.find(params[:itinerary_id]) # mandatory de tout renseigner pour un path complet
    @review.itinerary_id = @itinerary.id # mandatory de tout renseigner pour récupérer l'info complète
    @review.user_id = current_user.id # mandatory de tout renseigner pour récupérer l'info complète
    if @review.save
      redirect_to itinerary_path(@itinerary.id)
    else
      render :new, status: :see_other
    end
  end

private


#rescue => exception

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

=begin
end
  def set_review
    @review = Review.find(params[:id])
  end

  def set_itineraries
    @itinerary_review = Itinerary_review.find_by!(slug: params[:id])
  end
=end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
