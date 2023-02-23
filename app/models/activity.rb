class Activity < ApplicationRecord
  belongs_to :itinerary
  validates :title, :address, :description, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode # , if: :will_save_change_to_address?
end
