class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :pick_time, presence:true
  validates :return_time, presence:true;
end
