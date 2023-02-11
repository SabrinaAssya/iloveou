class Activity < ApplicationRecord
  belongs_to :itinerary
  validates :title, :address, :description, presence: true
  has_one_attached :photo
end
