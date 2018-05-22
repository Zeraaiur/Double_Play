class Item < ApplicationRecord
  has_many :bookings
  belongs_to :user
<<<<<<< HEAD
  validates :name, presence:true
=======

  validates :name, presence: true
>>>>>>> d3c511bf292cbf4ff4b20b6f6e451e37aae0cc6c
  validates :description, presence: true
  validates :price, presence: true
end
