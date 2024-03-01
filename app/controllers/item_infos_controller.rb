class ItemInfosController < ApplicationController
  def index
    @item_info = ItemInfo.order("created_at DESC")
  end

  def new
  end
end
