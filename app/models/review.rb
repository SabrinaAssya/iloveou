class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :content, length: { minimum: 4 }, presence: true

  RATING = [1, 2, 3, 4, 5]

  validates :rating, inclusion: {
    in: RATING,
    message: "must be between 1 and 5"
  }
end
