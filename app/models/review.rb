class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user
  validates :content, length: { minimum: 4 }, presence: true
  AUTHORIZED_RATINGS = (1..5)

  validates :rating, inclusion: { in: AUTHORIZED_RATINGS, message: "rating must between 1 and 5" }

end
