class ActivitiesController < ApplicationController

  def index
    @activities = Activity.where(itinerary: Itinerary.find(params[:itinerary_id]))
    # The `geocoded` scope filters only flats with coordinates
  end

  def show
    @activity = Activity.find(params[:id])
    @itinerary_id = @activity.itinerary.id
    @itinerary= Itinerary.find(@itinerary_id)
    @itinerary.user = current_user
  end

  def new
    @activity = Activity.new
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @activity = Activity.new(activity_params)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity.itinerary = @itinerary
    if @activity.save
      redirect_to itinerary_path(@itinerary)
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
    redirect_to itinerary_activities_path(Itinerary.find(params[:itinerary_id])), status: :see_other
  end

  def info
    @activities = Activity.all
    @itinerary = Itinerary.find(params[:itinerary_id])

    @activity.itinerary = @itinerary
  end
  private

  def activity_params
    params.require(:activity).permit(:title, :address, :description, :photo)
  end
end
