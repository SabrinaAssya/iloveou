class AddRatingToItinerary < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :rating, :float
  end
end
