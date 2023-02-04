class Review < ApplicationRecord
  belongs_to :itinerary, dependent: :destroy
  belongs_to :user

  validates :rating, :content, presence: true
end
