class DeleteWeatherFromItinerary < ActiveRecord::Migration[7.0]
  def change
    remove_column :itineraries, :weather
  end
end
