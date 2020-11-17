class ItemsController < ApplicationController

  def index
    @items = Item.limit(5).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text)
  end

end
