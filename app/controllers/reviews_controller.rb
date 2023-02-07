class ReviewsController < ApplicationController

  def index
    @review = Review.all
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
      redirect_to itinerary_reviews_path(@itinerary.id, @review.id)
    else
      render :new, status: :see_other
    end
  end

  def show
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.user = current_user
    @review.destroy
    redirect_to review_path status: :see_other
  end

private

  def set_itineraries
    @itinerary_review = Itinerary_review.find_by!(slug: params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
