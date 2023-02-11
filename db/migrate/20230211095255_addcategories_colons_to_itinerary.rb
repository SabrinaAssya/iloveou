class AddcategoriesColonsToItinerary < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :restaurant, :boolean, default: false, null: false
    add_column :itineraries, :culture, :boolean, default: false, null: false
    add_column :itineraries, :drinks, :boolean, default: false, null: false
    add_column :itineraries, :outdoor, :boolean, default: false, null: false
    add_column :itineraries, :original, :boolean, default: false, null: false
  end
end
