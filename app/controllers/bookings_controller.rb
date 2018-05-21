class BookingsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    if @booking.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @booking = Booking.find(params[:id])
  end

  def update
     @booking = Booking.find(params[:id])
     @item = Item.find(params[:item_id])
    if @booking.update(booking_params)
      redirect_to item_path(@item)
    else
      render: edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @item = Item.find(params[:item_id])
    @booking.delete
    redirect_to item_path(@item)
  end

  private

  def booking_params
    params.require(:booking).permit(:pick_time, :return_time)
  end
end
