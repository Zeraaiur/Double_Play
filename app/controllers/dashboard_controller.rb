class DashboardController < ApplicationController
  def index
    @user_items = current_user.items
    @bookings = current_user.bookings
    @bookings_on_my_items = current_user.bookings_on_my_items
    # @rentals = Item.where(:user_id => current_user.id) # Needs && :rented => false
  end
end
