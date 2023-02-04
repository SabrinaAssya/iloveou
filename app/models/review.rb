class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :rating, :content, presence: true
end
