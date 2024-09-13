class Room < ApplicationRecord
  belongs_to :hotel
  has_many :reservations


  validates :room_type, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

end
