class Activity < ApplicationRecord
  belongs_to :itinerary, dependent: :destroy
  belongs_to :category
  belongs_to :user
  validates :title, :address, :description, presence: true
end
