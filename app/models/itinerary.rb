class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :station
  validates :title, :weather, :price, :duration, presence: true
  enum weather: {
    sunny: 0,
    cloudy: 1,
    rainy: 2,
  }
end
