class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :opinions, dependent: :destroy
  has_many :reviews
  has_one_attached :image

  def average_rating
    reviews.average(:rating) || 0
  end
  def average_rating
    opinions.average(:rating).to_f.round(2)
  end
end
