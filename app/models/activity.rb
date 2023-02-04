class Activity < ApplicationRecord
  belongs_to :itinerary
  belongs_to :category

  validates :title, :address, :description, presence: true
end
