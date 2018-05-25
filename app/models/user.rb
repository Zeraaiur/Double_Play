class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, PhotoUploader

  has_many :bookings, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :bookings_on_my_items, through: :items, source: :bookings

  validates :last_name, presence:true
  validates :username, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
