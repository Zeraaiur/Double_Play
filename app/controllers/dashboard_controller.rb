class DashboardController < ApplicationController
  def index
    @user_items = Item.where(:user_id => current_user.id)
    @bookings = Booking.where(:user_id => current_user.id)
    @rentals = Item.where(:user_id => current_user.id) # Needs && :rented => false
  end
end
