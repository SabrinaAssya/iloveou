class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity.user_id = current_user
  end

  def create
    @activity = Activity.new(activity_params)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activity.user_id = current_user.id
    @activity.itinerary_id = @itinerary.id
    @activity.category_id = Category.first.id
    if @activity.save
      redirect_to itinerary_activities_path(@itinerary.id, @activity.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(activity_params)

  end

  def update
    @activity = Activity.find(activity_params)
    @activity.update(params[:activity])
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(activity_params)
    @activity.destroy
    redirect_to activities status: :see_other
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :address, :description)
  end
end
