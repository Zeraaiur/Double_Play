class ItemsController < ApplicationController
  def index
    # @items = Item.all
    if params[:query].present?
      @items = Item.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @user_id = @item.user_id
    @user_address = User.find_by_id(@user_id).address
    # raise
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
