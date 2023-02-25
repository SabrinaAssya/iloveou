class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :station
  has_many :reviews, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :places
  #validates :title, :weather, :price, :duration, presence: true

  after_touch :set_average_rating

  private 

  def set_average_rating
    ratings = self.reviews.pluck(:rating)
    sum = ratings.sum
    average = sum / ratings.length
    self.update(rating: average)
  end
end

