class Item < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence:true
  validates :description, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
