class Activity < ApplicationRecord
  belongs_to :itinerary, dependent: :destroy
  belongs_to :category
  validates :title, :address, :description, presence: true
end
