class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to @review
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to @review
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # redirect_to review_path, status: :see_other
  end

private

  def review_params
    params.require(:review)
      permit(:title, :rating, :content)
  end
end
