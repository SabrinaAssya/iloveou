class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :station
  has_many :reviews, dependent: :destroy
  has_many :activities, dependent: :destroy
  #validates :title, :weather, :price, :duration, presence: true
end
