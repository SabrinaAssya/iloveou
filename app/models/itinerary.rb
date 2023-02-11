class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :station
  has_many :reviews, dependent: :destroy
  #validates :title, :weather, :price, :duration, presence: true

  enum weather: {
    sunny: 0,
    cloudy: 1,
    rainy: 2,
  }

  enum price: {
    "$": 0,
    "$$": 1,
    "$$$": 2,
  }

  enum duration: {
    "1h-2h": 0,
    "2h-4h": 1,
    "More than 4h": 2,
  }
end
