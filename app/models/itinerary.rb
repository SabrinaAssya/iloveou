class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :station
  validates :title, :weather, :price, :duration, presence: true
end
