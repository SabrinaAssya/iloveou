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
    #ratings = self.reviews.pluck(:rating)
    #sum = ratings.sum
    #average = sum / ratings.length
    #self.update(rating: average)

    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    average = ratings.sum.fdiv(ratings.size)
    self.update(rating: average.round(2))
  end

end
