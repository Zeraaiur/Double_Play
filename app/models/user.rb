class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :last_name, presence:true
  validates :username, presence: true
  validates :last_name, presence: true
  validates :city, presence: true

end
