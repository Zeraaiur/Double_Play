class ItemsController < ApplicationController
  def index
    # @items = []
    # if params[:query].present? && params[:query2].present?
    #   items_choice = Item.where("name ILIKE ?", "%#{params[:query]}%")

    #   items_choice.each do |choice|
    #     if choice.user.address == params[:query2]
    #       @items.push choice
    #     end
    #   end
    #   return @items
    # else
    #   @items = Item.all
    # end


    # if params[:query].present?
    #   @items = Item.where("title ILIKE ?", "%#{params[:query]}%")
    # else
    #   @items = Item.all
    # end

    if params[:query2].present?
      near_user_ids = User.near(params[:query2], 100).map(&:id)
      @items = Item.where(user_id: near_user_ids)
    else
      @items = Item.joins(:user).where("users.latitude IS NOT NULL AND users.longitude IS NOT NULL")
    end

    if params[:query].present?
      @items = @items.search_by_name(params[:query])
    end

    @markers = @items.map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

  end

  def show
    @all_item = Item.all
    @item = Item.find(params[:id])
    @booking = Booking.new
  end

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @user = User.find(current_user.id)
    @item = Item.new(strong_params)
    @item.user = @user

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(strong_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to bookings_path

  end

  private

  def strong_params
    params.require(:item).permit(:name, :description, :price, :photo)

  end

end
