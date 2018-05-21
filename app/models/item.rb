class Item < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :description, presence: true
  validates :prices, presence: true
end
