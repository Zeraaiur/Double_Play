class DashboardController < ApplicationController
  def index
    @user_items = Item.where(:user_id => current_user.id)
    @bookings = Booking.where(:user_id => current_user.id)
    # Need to update DB for boolean of rented
    # @rentals = Item.where(:user_id => current_user.id && :rented => false)
  end
end
