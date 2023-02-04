class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params[:activity])
    @activity.save
    redirect_to_activity_path(@activity)
  end

  def edit
    @activity = Activity.find(params[activity_params])

  end

  def update
    @activity = Activity.find(params[activity_params])
    @activity.update(params[:activity])
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[activity_params])
    @activity.destroy
    redirect_to activities status: :see_other
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :address, :description )
  end
end
