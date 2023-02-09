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
    "0-1h": 0,
    "1-2h": 1,
    "more than 3h": 2,
  }
end
