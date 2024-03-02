class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(user_id: current_user.id)
  end
end
