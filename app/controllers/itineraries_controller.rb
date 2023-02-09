class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[show update destroy]

def index
  @itineraries = Itinerary.all
  
  if params[:sort_populars].present?
    @itineraries = @itineraries.order(rating: :desc)
  end 

  if params[:sort_recent].present?
    @itineraries = @itineraries.order(rating: :desc)
  end 
end

def new
  @itinerary = Itinerary.new
end

def create
  @itinerary = Itinerary.new(itinerary_params)
  @itinerary.user = current_user
  if @itinerary.save!
    redirect_to itineraries_path(@itinerary), notice: 'Itinerary was successfully created.'
  else
    render :new, status: :unprocessable_entity
  end
end

def show
end


def update
  if @itinerary.update(itinerary_params)
    redirect_to itineraries_path
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
  params.require(:itinerary).permit(:title, :description, :price, :duration, :station_id, :weather)
end

end
