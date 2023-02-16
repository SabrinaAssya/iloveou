class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :station
  has_many :reviews, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favorites
  #validates :title, :weather, :price, :duration, presence: true
end
