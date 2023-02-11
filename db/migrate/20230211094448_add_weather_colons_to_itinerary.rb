class AddWeatherColonsToItinerary < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :sunny, :boolean, default: false, null: false
    add_column :itineraries, :cloudy, :boolean, default: false, null: false
    add_column :itineraries, :rainy, :boolean, default: false, null: false
  end
end
