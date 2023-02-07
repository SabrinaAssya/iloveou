class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @activity = Activity.new(activity_params)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity.itinerary = @itinerary
    @activity.category = Category.first
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])

  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities status: :see_other
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :address, :description)
  end
end
