class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[show edit destroy update]

  def index
    @itineraries = Itinerary.all
    @itineraries = station_results(@itineraries, params)
    @itineraries = results_filters(@itineraries, params)
    @itineraries = sort_results(@itineraries, params)
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

  def sort_results(itineraries, params)

    if params[:search].present? && params.dig(:search, :sort) == "Populars"
      itineraries = itineraries.order(rating: :desc)
    end

    if params[:search].present? && params.dig(:search, :sort) == "Populars"
      itineraries = itineraries.order(rating: :desc)
    end

    if params[:search].present? && params.dig(:search, :sort) == "Newests"
      itineraries = itineraries.order(created_at: :asc)
    end

    if params[:search].present? && params.dig(:search, :sort) == "Oldests"
      itineraries = itineraries.order(created_at: :desc)
    end

    if params[:search].present? && params.dig(:search, :sort) == "Random"
      itineraries = itineraries .order("RANDOM()")
    end

    return itineraries
  end

  def results_filters(itineraries, params)
  
    if params[:search].present? && params.dig(:search, :price).present?
      @prices = params.dig(:search, :price)
      itineraries = itineraries.where(price: @prices)
    end

    if params[:search].present? && params.dig(:search, :duration).present?
      @duration = params.dig(:search, :duration)
      itineraries = itineraries.where(duration: @duration)
    end

    if params[:search].present? && params.dig(:search, :weather).present?
      @weather = params.dig(:search, :weather)
      @weather.each do |weather| 
        if weather == "sunny"
           itineraries = itineraries.where(sunny: true) 
        elsif weather == "cloudy"
          itineraries = itineraries.where(cloudy: true) 
        elsif weather == "rainy"
          itineraries = itineraries.where(rainy: true)
        end
      end
    end

    if params[:search].present? && params.dig(:search, :categories).present?
      @categories = params.dig(:search, :categories)
      @categories.each do |category| 
        if category == "restaurant" && params.dig(:search, :restaurant).present?
           itineraries = itineraries.where(restaurant: true) 
        elsif category == "culture" && params.dig(:search, :culture).present?
          itineraries = itineraries.where(culture: true) 
        elsif category == "drinks" && params.dig(:search, :drinks).present?
          itineraries = itineraries.where(drinks: true)
        elsif category == "outdoor"
          itineraries = itineraries.where(outdoor: true)
        elsif category == "original"
          itineraries = itineraries.where(original: true)
        end
      end
    end

  return itineraries
  end

  def station_results(itineraries, params)
    if params[:search].present? && params.dig(:search, :station).present?
      itineraries = itineraries.joins(:station).where("stations.name ILIKE ?", "#{params.dig(:search, :station)}%")
    end
  return itineraries
  end
end

