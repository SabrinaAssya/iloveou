class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[show edit destroy update]

def index

  @itineraries = Itinerary.all

  if params[:sort_populars].present?

    @itineraries = @itineraries.order(rating: :desc)
  end

  if params[:sort_newests].present?
    @itineraries = @itineraries.order(created_at: :asc)
  end 

  if params[:sort_oldests].present?
    @itineraries = @itineraries.order(created_at: :desc)
  end 

  if params[:sort_radom].present?
    @itineraries = @itineraries .order("RANDOM()")
  end 
end

def new
  @itinerary = Itinerary.new
end

def show
end

def create
  @itinerary = Itinerary.new(itinerary_params)
  @itinerary.user = current_user
  if @itinerary.save!
    redirect_to itineraries_path, notice: 'Itinerary was successfully created.'
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
end

def update
  if @itinerary.update(itinerary_params)
    redirect_to itinerary_path(@itinerary)
  else
    render :new, status: :unprocessable_entity
  end
end

def destroy
  @itinerary.destroy
  redirect_to itineraries_path, notice: 'Itineraries was successfully destroyed.'
end

private

def set_itinerary
  @itinerary= Itinerary.find(params[:id])
end

def itinerary_params
  params.require(:itinerary).permit(:title, :description, :weather, :price, :duration, :station_id, :user_id )
end

end
