class ItinerariesController < ApplicationController

def new
  @itinerary = Itinerary.new
end

def create
  @itinerary = Itinerary.new(params_id)
  @itinerary.user = current_user
end


end
