class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(strong_params)
    if @item.save
      # redirect_to WHERE ??? <== TO REVIEW
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(strong_params)
      # redirect_to @item, notice "Item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    # redirect_to items_path <== TO REVIEW
  end

  private

  def strong_params
    params.require(:item).permit(:name, :description, :price, :photo)

  end

end
