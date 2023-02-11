class Activity < ApplicationRecord
  belongs_to :itinerary
  validates :title, :address, :description, presence: true
end
